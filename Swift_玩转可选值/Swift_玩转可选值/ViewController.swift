//
//  ViewController.swift
//  Swift_玩转可选值
//
//  Created by 叶杨 on 2016/11/29.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var property: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

/**
 可选值的解包，包括强制解包“！” ,可选绑定机制，if/guard let xxx= xxx{}
 ，有一个更好的替换方法就是？？运算符
 */

infix operator ??

//简单来说定义是这样的，但是有个问题，如果default的值是通过某个函数或表达式得到的，那么无论可选值是否为nil，default都会被求值，
// 1
//func ??<T>(optional:T?,defaultValue:T) -> T {
//    
//    if let x = optional {
//        return x
//    }else{
//        return defaultValue
//    }
//}

//2 作为T类型的替代，我们提供了一个（）-》T的类型默认值，现在default闭包中的代码当我们对让他进行调用的时候才会调用，在这样的定义下，代码只会在else语句执行时，美中不足的是当调用？？运算符时需要默认值创建一个显示的闭包
//使用场景了类似这样 ?? { return someMethod()}
//func ??<T>(optional:T?,defaultValue:() -> T) -> T {
//    
//    if let x = optional {
//        return x
//    }else{
//        return defaultValue()
//    }
//}

//3, swift标准库中定义通过使用autoclosure类型标签来避开创建显示的闭包需求，它会在所学的闭包中隐士的将参数封装到？？运算符，不需要显示的鞋{return **（）} 只需要 输入返回值 **（）即可，大大优化了代码，
//要注意的是@autoclosure只能用在（）->T这样无参数的闭包中
func ??<T>(optional:T?, defaultValue:@autoclosure () -> T) -> T {
    
    if let x = optional {
        return x
    }else{
        return defaultValue()
    }
}


// 4 ,可选值链

struct Order {
    
    let orderNumber: Int
    let person: Person?
}

struct Person {
    let name: String
    let address: Address?
}

struct Address {
    let streetName : String
    let city : String
    let state: String?
}

//4.1 我们可以“显式解包运算符：order.person!.address!.state!  
//但是如果任意中间数据缺失，这么做就会导致运行时错误使用可选绑定更安全 if let = { if let = { if let = { } }}
//但是可选绑定又太麻烦，可选连就方便许多  if let myState = order.person?.address?.state{ }else{}
//我们还可以更简单的使用 guard let ** = ** else{ return **} 它会让控制流更简单


//5,可选映射

/**
 ？运算符允许我们选择性的访问可选值得方法或字段，然而在很多的其他例子中若可选值存在，你可能会想操作它，否则返回nil
 */

func incrementOpitional(opitional:Int?)-> Int?{
    
    guard let x = opitional  else {
        return nil
    }
    return x + 1
}

extension Optional{
    
    func map<U>(transform: (Wrapped) -> U) -> U? {
        
        guard let x = self else {
            return nil
        }
        return transform(x)
    }
}

//使用map来重写incrementOpitional方法

func incrementOpitionalTwo(opitional:Int?)-> Int?{
    
    return opitional.map(transform: { $0 + 1 })
    
}



