//
//  DMNetWork.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/28.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class DMNetWork: NSObject {
    
    class func requestJSON(method:Alamofire.Method,
        _ URLString: URLStringConvertible,
        parameters: [String: AnyObject]? = nil,
        completion:(JSON: AnyObject?)->()){
            
        Alamofire.request(method, URLString, parameters: parameters).responseJSON { (Response) in
                if Response.result.isSuccess == false || Response.result.error != nil || Response.result.value == nil{
                SVProgressHUD.showInfoWithStatus("数据出错")
                }else{
                completion(JSON: Response.result.value)
                }
            print(Response.debugDescription)
            }
    }
}
