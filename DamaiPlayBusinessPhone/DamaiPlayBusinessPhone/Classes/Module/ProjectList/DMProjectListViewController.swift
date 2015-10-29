//
//  DMProjectListViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/23.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class DMProjectListViewController: UITableViewController {
    
    private var projectListInfo:DMProjectListInfo?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页"
        
        loadData()
 
    }
    
    /// 加载数据
    private func loadData(){
        
        let urlString:String = "http://fb.jtwsm.cn/recount/GetRecountActivitys_show.do"
        
        let params:Dictionary<String,AnyObject> = ["m":DMMValueAndVValue.getDataMValue() ,"pageIndex":1,"pageSize":2,"source":100001,"version":10100]
        
        DMNetWork.requestJSON(.GET, urlString, parameters: params) { (JSON) in
            let jsonResult:[String:AnyObject] = JSON as! [String : AnyObject]
            let erroCode:Int = jsonResult["errorCode"] as! Int
            
            print("这是一个错误信息\(erroCode)")
            
            if erroCode != 0 {
                SVProgressHUD.showErrorWithStatus("数据返回错误")
            } else{
                let recountActivitysList:[String:AnyObject] = jsonResult["obj"]!["recountActivitysList"] as! [String : AnyObject]
                let projectListInfo:DMProjectListInfo = DMProjectListInfo(dict: recountActivitysList)
                
                let array = projectListInfo.activityInfos
                var mutaArray:[DMactivityInfoDto]? = Array()
                
                for activityInfoDto in array! {
                    let InfoDto:DMactivityInfoDto =  DMactivityInfoDto(dict: activityInfoDto as! [String : AnyObject])
                    mutaArray?.append(InfoDto)
                }
                
                projectListInfo.activityInfos = mutaArray!
                
                self.projectListInfo = projectListInfo
                
                print("模型的所有东西\(projectListInfo)")
                self.tableView.reloadData()
            }
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectListCells", forIndexPath: indexPath) as! DMProjectListCell
    let InfoDto:DMactivityInfoDto = (self.projectListInfo?.activityInfos?[indexPath.row]) as! DMactivityInfoDto
        cell.projectListInfo = InfoDto
        
        return cell
    }



}
