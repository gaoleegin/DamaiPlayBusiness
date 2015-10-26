//
//  DMMValueAndVValue.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/23.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class DMMValueAndVValue: NSObject,NSCoding {
    let MValue:String
    let VValue:String
    
    init(dict: [String: AnyObject]) {
        MValue = dict["M"] as! String
        VValue = dict["V"] as! String
    }
    
   //归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(MValue, forKey: "M")
        aCoder.encodeObject(VValue, forKey: "V")
    }
    
    //解档
    required init?(coder aDecoder: NSCoder) {
      MValue = aDecoder.decodeObjectForKey("M") as! String
      VValue = aDecoder.decodeObjectForKey("V") as! String
    }
    
    static func  getDataMValue()->(String){
        
        let MValue:DMMValueAndVValue =  NSKeyedUnarchiver.unarchiveObjectWithFile(DMUserLoginViewController.path) as!DMMValueAndVValue
        
        return MValue.MValue
    }
    
}
