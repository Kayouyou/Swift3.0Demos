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
        
        //会调用class的默认构造器创建一个实例
        _ = ShoppingList()
        
        
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

//demo3  === 可选属性类型 ===
class SurveryQuestion {
    
    //如果你在定义一个类型的时候有一个允许在初始化的时候允许它为空，那就定义它为可选类型，它将在自动初始化的时候设置为nil。
    var text: String
    
    //构造过程中常量属性的修改，注意：对类实例来说，它的常量属性只能在定义它的类的构造过程中被修改，不能在子类中修改。
    //你可以在构造过程中的任意时间点给常量属性制定一个值，只要在构造过程结束是有个确定的值，一旦值确定就不可以改变了
    //let text: String
    
    var response: String?
    
    init(text:String) {
        
        self.text = text
    }
    
    func ask() {
        
        print(text)
    }
}

//demo4  ===默认构造器===
//如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么Swift久会给这些结构体或类提供一个默认的构造器，这个默认的构造器就要创建一个所有的属性都设置为默认值的实例
class ShoppingList {

    /**
     由于此类中所有的属性都有默认值，且它是没有父类的基类，它将自动获取一个可以为所有的属性设置为默认值的默认构造器
     ShoopingList()形式的构造器语法
    */
    
    var name:String?
    var quantity = 1
    var purchased = false
}

//demo5 结构体的逐一成员构造器
//如果结构体没有提供自定义的构造器，他们将会自动获得一个逐一的成员构造器，即使结构体的存储属性没有默认值
//结构体Size自动获取一个逐一成员构造器init(width:height:)，你可以用它来为Size创建新的实例
struct Size  {
    var width = 0.0,height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

//demo6 值类型的构造代理
struct Rect {
    
    var origin = Point()
    var size   = Size()
    
    //1,它在功能上跟没有自定义的构造器时获取的默认构造器是一样的，这个构造器是一个空函数，没有执行任何构造过程，调用这个构造器将会返回一个Rect实例，它的origin和size属性使用定义时的默认值
    init(){}
    
    //2,它的功能跟没有自定义构造器时获取的结构体逐一构造器是一样的，这个构造器只会简单的将origin和size的参数赋值给对应的存储属性
    init(origin: Point,size: Size) {
        
        self.origin = origin
        self.size   = size
    }
    
    //3,自定义构造器：它先通过center和size算出origin的坐标，然后在调用（代理）给init(origin,size)构造器来讲新的origin和size的值赋值给对应的属性
    init(center:Point,size:Size) {
        
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        //这个构造器可以直接将origin和size的值赋值给对应的属性，但是这里充分利用了已有的构造器会更方便，构造器的意图也更明晰
        self.init(origin:Point(x: originX, y: originY),size:size)
    }
    
}































