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
        
        //注意如果构造器定义了外部参数你就必须使用它，忽略它就导致编译错误
        _ = Color(white: 0.5)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//demo1   ===构造器简单了解===
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

//demo2   ===自定义构造过程===
struct Celsius {
    
    var temperaturte: Double
    
    /**
     结构体包括两个构造器函数，都分别有外部参数名和内部参数名，因为构造器不像函数那样在括号前有一个可辨别的名字，主要通过构造器中的参数名和类型来确定应该被调用的构造器，如果没有人为的定义构造器是提供和外部参数名，Swfit会为构造器的每个参数自动生成一个跟内部名称相同的外部名
 
    */
    //1 如果不想带外部参数名，就用下划线 “_” 代替它
    init(fromFahrenheit fahrenheit:Double) {
        
        temperaturte = (fahrenheit - 32.0)/1.8
        
    }
    //2
    init(fromKelvin kelvin:Double) {
        
        temperaturte = kelvin - 273.15
    }
}

struct Color  {
    
    let red, green,blue: Double
    //1
    init(red:Double,green:Double,blue:Double) {
        //使用self为区别参数和自身的属性,一般不会写self
        self.red = red
        self.green = green
        self.blue  = blue
    }
    //2,
    init(white:Double) {
        
        red = white
        blue = white
        green = white
    }
}












