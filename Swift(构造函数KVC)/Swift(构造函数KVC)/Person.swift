//
//  Person.swift
//  Swift(构造函数KVC)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

/**
 1，在定义模型属性的时候，如果是对象通常是可选的,不需要写构造函数，简化代码
 2，使用KVC方法之前应调用super.init保证实例化完成！
 3，如果是基本数据类型，不能设置为可选的，而且要设置初始值，否则KVC要崩溃
 4，如果是private属性，使用KVC时同样无法设置，因为Swift是禁止外部访问的，跟OC不同
 5，如果使用KVC设置数值，属性不能是Private
 
 */
class Person: NSObject {

    //name属性是可选的，在OC中很多都是在需要的时候创建的
    //延迟加载，在需要的时候加载
    var  name : String?
    var  age : Int = 0//给基本数据类型初始化
   
    //使用KVC 会提示无法找到age的key
    //原因： Int 是一个基本数据类型结构体，OC中没有，OC中只有基本数据类型
//    var  age :Int?
    
//    private var title: String?
    var title: String?
    
    //重载
    init(dict: [String: AnyObject]) {
        
        //保证对象已经完全初始化完成
        super.init()
        
        //使用self的方法 setValueForKey 之前 应调用super.init
        //KVC的方法是OC的方法，实现的时候是在运行时给对象发送消息，要求对象已经实例化完成，所以super.init在之前
        setValuesForKeys(dict)
        
        
    }
    
    //字典比属性多的时候，重写undefinedKey,不然会崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //没有调用super，将父类的代码覆盖，就不会崩溃！
    }
    
    
}
