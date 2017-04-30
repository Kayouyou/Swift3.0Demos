//: Playground - noun: a place where people can play

import UIKit

//swift中协议不仅可以被class实现，也可被struct和enum使用！这个时候需要用关键字 mutating来修饰protocol的func，为了使用协议的人可以在结构体和枚举方法中的变量

protocol Vehicle{
    
    var numofVehicle:Int {get}
    var color:UIColor {get set}
    mutating func changeColor()
}

struct MyCar:Vehicle{
    
    let var numofVehicle = 4
    var color = .black
    
    mutating func changeColor() {
        
        color = .red
    }
}

//以上protocol中，如果去掉mutating，会报错说没有实现协议，如果去掉的话，会报错不能修改变量的值

//另外需要注意的是：mutating对class是完全透明的，无需加mutating修饰！！！