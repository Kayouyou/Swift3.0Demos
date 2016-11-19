//
//  CustomItem.swift
//  RealmManager_Swift
//
//  Created by 666GPS on 2016/11/18.
//  Copyright © 2016年 yeyangyang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ConsumeType: Object {
    
    //类型名
    dynamic var name = ""
}

class CustomItem: Object {

    //条目名
    dynamic var name = ""
    //金额
    dynamic var cost = 0.00
    //时间
    dynamic var date = NSDate()
    //所属消费类别
    dynamic var type:ConsumeType?
    
    
}
