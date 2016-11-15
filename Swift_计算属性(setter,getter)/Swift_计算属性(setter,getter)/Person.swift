//
//  Person.swift
//  Swift_计算属性(setter,getter)
//
//  Created by 叶杨杨 on 2016/11/15.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class Person: NSObject {

   private var _name :String?
    // getter & setter  仅供演示，日常开发不用
    //Swift中 一般不会重写 getter setter 方法
    var  name: String?{
        
        get{
            //返回成员变量
           return _name
        }

        set{
            //使用成员变量记录值
           _name = newValue
        }
        
    }
    
    
    
    
    
    
}
