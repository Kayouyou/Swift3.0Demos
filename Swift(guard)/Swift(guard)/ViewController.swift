//
//  ViewController.swift
//  Swift(guard)
//
//  Created by 叶杨杨 on 2016/11/6.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

/// guard 语法 以及遍历构造函数

class ViewController: UIViewController {

    //基础数据类型在OC中没有可选，如果定义了可选，运行时同样获取不到，使用KCV就会崩溃
    var age: Int?
    //private的属性，使用运行时同样会获取不到属性（可以获取到IVAR）使用KCV同样会导致崩溃
    
    override func viewDidLoad() {
        super.viewDidLoad()
        age = 6
        guard age == 0 else {
            
            print(age!)
            return
        }
        //url的构造方法可以返回nil
       let url = URL(string: "http://www.baidu.com")
        //跟OC不同的还是闭包的参数需要自己写，OC是直接带出 
        //如果不关心的值，可以直接下划线忽略_
       URLSession.shared.dataTask(with: url!) { (data, _, error) in
       
        if(error != nil){
            
            print("网络请求失败")
            return
        }
        
        guard let data = data else{
            
            print("网络请求失败\(error)")
            
            return
        }
        
        let html = String(data: data, encoding: .utf8)
        
        print(html ?? "没有数据")
        
        }.resume()
        
        let p = Person(name: "老王", age: 100)
        print(p?.name ?? "name 为空")
        
    }

    




}

