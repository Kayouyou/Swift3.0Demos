//
//  ViewController.swift
//  Swift(构造函数KVC)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //如果子类没有重写父类的方法，子类直接调用父类的方法
        
        let p = Student(dict: ["name" : "老张" as AnyObject,"age" : 19  as AnyObject , "title" : "标题" as AnyObject,"num" : "001" as AnyObject , "****" : "unKey" as AnyObject])
        print("\(p.name) \(p.age) \(p.num)")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

