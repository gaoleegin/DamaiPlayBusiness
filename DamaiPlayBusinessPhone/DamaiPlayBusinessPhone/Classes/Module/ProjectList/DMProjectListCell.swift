//
//  DMProjectListCell.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/29.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import SDWebImage

class DMProjectListCell: UITableViewCell {
    
    //项目图片
    @IBOutlet weak var projectIcon: UIImageView!
    //项目的名字
    @IBOutlet weak var projectName: UILabel!
    //项目的时间
    @IBOutlet weak var projectTime: UILabel!
    //项目的状态
    @IBOutlet weak var projectStatus: UILabel!
    
    var projectListInfo: DMactivityInfoDto? {
        didSet {
           projectIcon.sd_setImageWithURL(NSURL(string: (projectListInfo?.img)!))
           projectName.text = projectListInfo?.projectName
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
