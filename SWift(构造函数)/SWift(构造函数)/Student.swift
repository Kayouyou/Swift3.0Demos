//
//  Student.swift
//  SWift(构造函数)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class Student: Person {

    var  number : String
    
    //重写
    override init() {
        
        number = "001"
        
        super.init()
    
    }
    
    //重载
    init(name: String, number:String) {
        
        self.number = number
    
        //调用父类的给name初始化
        super.init(name: name)
    }
    
    
    
}
