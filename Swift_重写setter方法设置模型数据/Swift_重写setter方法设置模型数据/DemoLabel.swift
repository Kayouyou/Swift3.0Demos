
//
//  DemoLabel.swift
//  Swift_重写setter方法设置模型数据
//
//  Created by 叶杨杨 on 2016/11/15.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class DemoLabel: UILabel {

    // 模型 -》给视图设置模型，由视图自己根据模型的数据显示内容
    var  person: Person?{
        //就是替换OC中重写setter方法
        //区别： 再也不用考虑 _成员变量 = 值
        //OC中 如果是copy属性  应该_成员变量 = 值.copy
        
        didSet{
            //此时  name属性已经有值了，可以直接使用设置UI内容
            text = person?.name
        }
        
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
