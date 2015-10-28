//
//  DMProjectListViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/23.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire

class DMProjectListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页"
        
        let mavalue:String =  DMMValueAndVValue.getDataMValue()
        
        print(mavalue)
        
        
        //http://fb.jtwsm.cn/recount/GetRecountActivitys_show.do?m=8BACF7CA76D89F4B80F4CC43C867C281&pageIndex=1&pageSize=10&source=100001&version=10100
        
        let params:Dictionary<String,AnyObject> = ["m":DMMValueAndVValue.getDataMValue() ,"pageIndex":1,"pageSize":2,"source":100001,"version":10100]
        
        
        DMNetWork.requestJSON(.GET, "http://fb.jtwsm.cn/recount/GetRecountActivitys_show.do", parameters: params) { (JSON) -> () in
            print(JSON)
            
            
        }
//       DMProjectListInfo.loadStatuses { (statuses) in
//            (statuses).activityInfos
//        }
//        
//        
//        
//        Alamofire.request(.GET, "http://fb.jtwsm.cn/recount/GetRecountActivitys_show.do", parameters: params).responseJSON { (Response) -> Void in
//            
//            print(Response.response)
//            print(Response.result.isSuccess)
//            print(Response.result.debugDescription)
//            print(Response.result.value)
//            
//            
//        }
        
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
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProjectListCells", forIndexPath: indexPath)

       

        return cell
    }



}
