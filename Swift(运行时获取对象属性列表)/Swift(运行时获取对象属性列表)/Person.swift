//
//  Person.swift
//  Swift(运行时获取对象属性列表)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class Person: NSObject {

    var   name: String?
    var    age: Int = 0
    var  title: String?
    
    // (使用运行时)获取当前类的所欲属性数据
    class func propertyLists() -> [String]{
        
        var count :UInt32 = 0
        
        
        //1,获取类的属性列表
      let list =   class_copyPropertyList(self, &count)
        
        print("属性的数量\(count)")
        
        for i in 0..<Int(count){
            
            //根据下获取属性
            let pty = list?[i]
            
            //获取属性名称
            //<Int 8> C语言的字符串
            let cName = property_getName(pty!)
            
//            print(cName)
            
            
            //转换成string类型
            let name = String(utf8String: cName!)
            print(name)
            
        }
        
        //释放C语言的对象
        free(list)
        
       return []
    }
    
    
    
}
