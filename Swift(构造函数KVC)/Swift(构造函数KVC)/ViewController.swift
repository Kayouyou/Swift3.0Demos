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
        
        let p = Person(dict: ["name" : "老张" as AnyObject,"age" : 19  as AnyObject , "title" : "标题" as AnyObject])
        print("\(p.name) \(p.age)")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

