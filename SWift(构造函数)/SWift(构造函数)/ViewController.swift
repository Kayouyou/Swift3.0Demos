//
//  ViewController.swift
//  SWift(构造函数)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

//在swift中不需要import，默认同一个项目中所有的类是共享的，所有对象的属性也可以访问到
//在swift中所有的类都默认有一个命名空间，swift中默认的就是项目的名称，不需要oc的那种冗长的命名方法
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       //实例化person
        
        let person = Person()
        print(person.name)
        
        let s = Student()
        print(s.number)
        
        //初始化用了重载的方法
        let p = Person(name:"ye")
        print(p)
        
        //如果不重写初始化init()，而只重载了init(name:,number)方法，默认就不能在使用Student()初始化
        let s1 = Student(name: "老王", number: "18929")
        print(s1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

