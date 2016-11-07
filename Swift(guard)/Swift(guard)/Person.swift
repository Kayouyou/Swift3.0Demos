//
//  Person.swift
//  Swift(guard)
//
//  Created by 叶杨杨 on 2016/11/6.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit
//便利构造函数
//定义：简化对象创建，本身不负责属性的创建和初始化工作
//convenience

class Person: NSObject {

    var  name : String?
    var  age : Int = 0
    
    /**
     1,便利构造函数允许返回nil
     - 正常的构造函数一定会创建对象
     - 判断给定的参数是否返回条件，如果条件不符合，就直接返回nil了不会创建对象，减少内存开销
     2，只有便利构造函数中才会使用self.init构造当前对象，
     - 没有convenicence关键字的构造函数是来负责创建对象的
     - 反则是用来检查条件，本身不负责创建对象
     3，如果要在便利构造函数使用当前对象的属性，一定要在self.init之后
    */
    
    
    //重载构造函数 加？ 允许他返回nil
    convenience init?(name: String,age :Int){
        
        if age > 100 {
            
            return nil
        }
        
        self.init()
        self.name = name
    }
    
    override init(){
        super.init()
        
        
//        self.init
        
    }
    
    
    
    
    
}
