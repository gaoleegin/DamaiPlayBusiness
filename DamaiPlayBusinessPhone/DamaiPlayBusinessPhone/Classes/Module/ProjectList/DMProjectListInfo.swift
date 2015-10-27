//
//  DMProjectListInfo.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/26.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire

private let urlString:String = "ttp://fb.jtwsm.cn/recount/GetRecountActivitys_show.do"

class DMProjectListInfo: NSObject {
    
    
    var activityInfos:NSArray?
    
    var endedActCount:Int = 0
    
    var startingActCount:Int = 0
    
    var total:Int = 0
    
    init(dict:[String : AnyObject]) {
        activityInfos = dict["activityInfos"] as? NSArray
        endedActCount = dict["endedActCount"] as! Int
        startingActCount = dict["startingActCount"] as! Int
        total = dict["total"] as! Int
    }
    
    //加载数据
    class func loadStatuses(completion:(statuses:DMProjectListInfo)->()) {
        let params:Dictionary<String,AnyObject> = ["m":DMMValueAndVValue.getDataMValue() ,"pageIndex":1,"pageSize":2,"source":100001,"version":10100]
        
        Alamofire.request(.GET, urlString, parameters: params).responseJSON { (Response) in
            
            print(Response.result.isSuccess)
            print(Response.response)
            print(Response.request)
            
            let dict1:NSDictionary = ["":""]
            
            //let projectInfo1:DMProjectListInfo = DMProjectListInfo(dict: dict1 as! [String : AnyObject])
            
            //就是的在短短的几天之内，真的就是在短短的几天zhine
            //completion(statuses: projectInfo1)
            //complication(projectListInfo: projectInfo1)
        }
        
    }
}



class DMactivityInfoDto:NSObject {
    var img:String?
    
    var auditStatus:Int?
    
    var projectName:String?
    
    var provinceId:Int=0

    var introduction:String?
    
    init(dict:[String:AnyObject]) {
        img = (dict["activityInfoDto"] as! NSDictionary)["img"] as? String
        auditStatus = dict["auditStatus"] as? Int
        projectName = dict["projectName"] as? String
        provinceId = dict["provinceId"] as! Int
        introduction = dict["introduction"] as? String
        
    }
}


