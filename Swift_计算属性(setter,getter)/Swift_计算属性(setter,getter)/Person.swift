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
    
    //OC中  定义属性的时候  有一个readonly-》getter
    var title:String{
        
        //之重写了getter方法，没有重写setter方法，就是只读属性
        get{
            
            return "Mr" + (name ?? "")
        }
    }
    
    //只读属性简写  直接return
    
    /// 又称为 计算性属性  它本身不保存内容，只通过计算来获取内容
    var title2: String{
        
        return "Mr xxx" + (name ?? "")
    }
    
    //懒加载完整写法 闭包
    //懒加载会在第一次访问的时候执行，闭包执行结束后，会吧结果保存在title3中
    //懒加载属性会存储内存空间，计算属性不会，只要调用过一次，后面的闭包再也不会执行了！
    lazy var title3:String = { [weak self] in
        
        return "lazy" + (self!.name ?? "")
    }()
    
    
    
    
}
