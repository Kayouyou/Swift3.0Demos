//
//  ViewController.swift
//  Swift_Initializer
//
//  Created by 叶杨 on 2016/11/26.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit

/// 构造器是使用类，结构体，枚举类型的实例之前准备过程，它跟OC不同，Swift的构造过程无需返回值，它的主要任务就是保证第一次使用时完成正确的初始化。

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        _ = Fahrenheit()
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//demo1  构造器简单了解
struct Fahrenheit {
    
    //你可以在构造器中为存储属性设置初始值，也可以在声明存储属性的时候设置初始值，最好在声明的时候设置初始值，
    //1,构造器中设置值
//    var temperature: Double
//   
//    init() {
//        
//       temperature = 16.0
//    }
    
    //2,声明时设置值，可以自动推导出类型
    var temperature = 18.0
    
}
