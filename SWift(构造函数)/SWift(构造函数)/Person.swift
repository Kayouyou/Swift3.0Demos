//
//  Person.swift
//  SWift(构造函数)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

/**
 构造函数步骤：
 
 1,给自己的属性分配空间并设置初始值
 2,重写父类的构造函数，给父类属性分配空间设置初始化值
 3,如果重载了构造函数，并没有实现父类的init方法，系统不再提供init（）构造函数
   - 因为默认的构造函数不能给本类的属性分配空间!
 
 
 NSObject没有属性，只有一个成员变量，isa

 跟OC 是反着的，OC先初始化父类，在初始化子类
 Swift，先初始化自己，在调用父类初始化方法
 */


//构造函数有多个，默认的是init
class Person: NSObject {

    //声明属性：name没有被初始化，
    var name: String
    
    //1，重写父类，override 关键字
    override init() {
        
        //问题是：name有初始值，但是所有的都是zhang！
         name = "zhang"
        //在调用父类的构造函数时候没有给name初始化会报错
        super.init()
    }
    
    //2，重载方法：函数名相同，但是参数和个数不同
    init(name:String) {
    
        self.name = name
        //调用父类构造函数
        super.init()
    }
    
    
    
}
