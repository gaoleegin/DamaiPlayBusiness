//
//  DMUserLoginViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/22.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class DMUserLoginViewController: UITableViewController {
    
    var firstTextField:UITextField? //第一个输入框
    var secondTextField:UITextField? //第二股输入框

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置tableview的属性
        setTableViewPropertites()
        
    
}
    /// 设置tableview的属性
    func setTableViewPropertites(){
        
        tableView.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
        
        //创建头部的控件
        let headewView = NSBundle.mainBundle().loadNibNamed("LoginViewHeader", owner: nil, options: nil).first as! UIView
        headewView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 250)
        tableView.tableHeaderView = headewView
        

        //创建足部控件
        let loginBtn = UIButton()
        loginBtn.backgroundColor = UIColor(red: 249/255.0, green: 56/255.0, blue: 69/255.0, alpha: 1.0)
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.layer.cornerRadius = 20.5
        loginBtn.clipsToBounds = true
        loginBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(17.0)
        let loginBtnW:CGFloat = 270
        let loginBtnY:CGFloat = 35
        let loginBtnH:CGFloat = 41
        let loginBtnX:CGFloat = (CGFloat(UIScreen.mainScreen().bounds.size.width) - loginBtnW) * 0.5
        loginBtn.addTarget(self, action: "loginBtnClicked", forControlEvents: UIControlEvents.TouchUpInside)
        loginBtn.frame = CGRectMake(loginBtnX, loginBtnY, loginBtnW, loginBtnH)
        
        let loginBtnBackView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 75))
        loginBtnBackView.backgroundColor = UIColor(red: 239/255.0, green: 239/255.0, blue: 239/255.0, alpha: 1.0)
        loginBtnBackView.addSubview(loginBtn)
        
        tableView.tableFooterView = loginBtnBackView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "loginCell")
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            /// 最前面的小图标
            let iconImage:UIImageView = UIImageView()
            iconImage.image = UIImage(named: "login_user")
            let iconImageX:CGFloat = 16
            let iconImageH:CGFloat = 17
            let iconImageW:CGFloat = 17
            let iconImageY:CGFloat = (53 - 17) * 0.5
            iconImage.frame = CGRectMake(iconImageX, iconImageY, iconImageW, iconImageH)
            cell.contentView.addSubview(iconImage)
            
            //中间的文字
            let titleLable:UILabel = UILabel()
            titleLable.text = "用户名:"
            titleLable.textColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 87/255.0, alpha: 1.0)
            titleLable.font = UIFont.systemFontOfSize(16)
            let titleLableX:CGFloat = CGRectGetMaxX(iconImage.frame) + 10
            let titleLableY:CGFloat = iconImageY
            let titleLableW:CGFloat = 60
            let titleLableH:CGFloat = 17
            titleLable.frame = CGRectMake(titleLableX, titleLableY, titleLableW, titleLableH)
            cell.contentView.addSubview(titleLable)
            
            //后面的输入框
            let firstTextField = UITextField()
            firstTextField.backgroundColor = UIColor.whiteColor()
            let firstTextFieldX:CGFloat = CGRectGetMaxX(titleLable.frame)
            let firstTextFieldY:CGFloat = 0
            let firstTextFieldW:CGFloat = UIScreen.mainScreen().bounds.size.width - firstTextFieldX
            let firstTextFieldH:CGFloat = 53
            firstTextField.frame = CGRectMake(firstTextFieldX, firstTextFieldY, firstTextFieldW, firstTextFieldH)
            cell.contentView.addSubview(firstTextField)
            self.firstTextField = firstTextField
            return cell
        } else{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "loginCell")
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            
            /// 最前面的小图标
            let iconImage:UIImageView = UIImageView()
            iconImage.image = UIImage(named: "login_lock")
            let iconImageX:CGFloat = 16
            let iconImageH:CGFloat = 17
            let iconImageW:CGFloat = 17
            let iconImageY:CGFloat = (53 - 17) * 0.5
            iconImage.frame = CGRectMake(iconImageX, iconImageY, iconImageW, iconImageH)
            cell.contentView.addSubview(iconImage)
            
            //中间的文字
            let titleLable:UILabel = UILabel()
            titleLable.text = "密    码:"
            titleLable.textColor = UIColor(red: 87/255.0, green: 87/255.0, blue: 87/255.0, alpha: 1.0)
            titleLable.font = UIFont.systemFontOfSize(16)
            let titleLableX:CGFloat = CGRectGetMaxX(iconImage.frame) + 10
            let titleLableY:CGFloat = iconImageY
            let titleLableW:CGFloat = 60
            let titleLableH:CGFloat = 17
            titleLable.frame = CGRectMake(titleLableX, titleLableY, titleLableW, titleLableH)
            cell.contentView.addSubview(titleLable)
            
            //后面的输入框
            let secondTextField = UITextField()
            secondTextField.backgroundColor = UIColor.whiteColor()
            let secondTextFieldX:CGFloat = CGRectGetMaxX(titleLable.frame)
            let secondTextFieldY:CGFloat = 0
            let secondTextFieldW:CGFloat = UIScreen.mainScreen().bounds.size.width - secondTextFieldX
            let secondTextFieldH:CGFloat = 53
            secondTextField.frame = CGRectMake(secondTextFieldX, secondTextFieldY, secondTextFieldW, secondTextFieldH)
            cell.contentView.addSubview(secondTextField)
            self.secondTextField = secondTextField
            return cell
        }
    
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 53
    }
    
    /// 登录按钮的点击事件
    func loginBtnClicked(){
        print("\(__FUNCTION__)")
        
        let userName:String = (self.firstTextField?.text)!
        let passWord:String = (self.secondTextField?.text)!
        
        SVProgressHUD.showWithStatus("正在加载")
        
        print("用户名：\(userName)" + "密码：\(passWord)")
        
    }
}
