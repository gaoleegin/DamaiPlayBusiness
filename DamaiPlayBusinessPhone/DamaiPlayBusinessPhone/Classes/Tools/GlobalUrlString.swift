//
//  GlobalUrlString.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/23.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import Foundation

/// 线上接口前缀
let DMAPIBaseURL:String = "http://wanapi.damai.cn";
let DMBuyTicketsandRegistrationURL:String = "http://fb.jtwsm.cn"

/// 测试接口前缀
let DMTESTAPIBaseURL:String = "http://192.168.41.7:8983/api"
let DMTESTBuyTicketsandRegistrationURL:String = "http://192.168.87.44:8181/fbjtwsm-war"; //报名购票下单 fbjtwsm-war/recount/GetUserInfoRest.do?

///用户登录
let kUserLogin:String = "/user/loginforticket.json"


/**
*  商家验票接口 http://192.168.87.44:8080/edp-war/recount/GetRecountActivitys_show.do
*/
let KBusineGetRecountActivitys:String = "/recount/GetRecountActivitys_show.do" //获取需要验票的活动信息接口
let KBusineGetPerformCheckStatisitcs:String = "/recount/GetPerformCheckStatisitcs_show.do" //查询各个场次验票数量的统计
let KBusineGetUserTicketByCode:String = "/recount/GetUserTicketByCode_show.do" //查询用户票务信息
let KBusineRecountTicket:String = "/recount/Recount.do" //验票接口
let KBusineGetPerformTicketList:String = "/recount/GetPerformTickets.do" //获取场次验票信息列表接口

//验票查询，支持手机号码的查询
let KBusineMobileCheckTicket:String = "/recount/GetUserTicketByCode_show_New.do"


//主办方的信息
let kMyview:String = "/recount/GetUserInfoRest.do"        // 主办方个人主页、第三方主页头部个人信息








