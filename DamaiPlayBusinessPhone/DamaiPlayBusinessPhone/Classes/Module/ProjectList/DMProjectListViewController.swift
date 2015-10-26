//
//  DMProjectListViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/23.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class DMProjectListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "首页"
        
        let mavalue:String =  DMMValueAndVValue.getDataMValue()
        
        print(mavalue)
        
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
