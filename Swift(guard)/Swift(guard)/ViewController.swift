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
        
        //通过便利构造函数简化控件创建
        
        
        /// text1 和 text2都是正确的创建方法，因为fontsize有默认值所以可以省略
        let text1 = UITextField(frame: CGRect(x:0,y:0,width:100,height:100), placeHolder: "默认值")
        view.addSubview(text1)
        
        let text2 = UITextField(frame: CGRect(x:0,y:100,width:100,height:100), placeHolder: "正常", fontSize: 15)
        view.addSubview(text2)
        
        let btn = UIButton(title: "测试", color: .blue)
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        btn.center = self.view.center
        view.addSubview(btn)
        
        age = 6
        guard age != 0 else {
            
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

    //它实际是析构函数
    deinit {
        
        //没有func说明不能被人为的调用
        
        //1,跟踪对象释放
        //2,必须释放的 (通知，不释放会泄露，KVO不释放会崩溃 NSTimer不释放会循环引用)
        
        
    }




}

