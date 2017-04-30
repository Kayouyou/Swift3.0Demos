//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//@autoclouse的作用就是把一句表达式自耦东封装成一个闭包

//1，
func logTrue(_ predicate:() -> Bool){
    
    if predicate() {
        
        print("True")
    }
}

logTrue({return 2 > 1})

logTrue({2 > 1})

logTrue{2 > 1}

//虽然我们简化了很多，但是还是书写起来比较麻烦
func logT(_ predicate:@autoclosure () -> Bool){
   
    if predicate() {
        print("True")
    }
}

//我们更简单的写出，swift会自动将2 > 1转换为 () -> Bool
logT(2 > 1)


//swift中还有一个操作符号 ？？ 它可以对nil进行条件判断,如果非空则返回其value，如果是空则返回？？后的默认值
var level: Int?
var startLevel = 1
var  currentLevel = level ?? startLevel

//？？ 有两个版本的定义
/**
 func ?? <T>(optional:T?,defaultValue:@autoclosure() -> T?) -> T?
 func ?? <T>(optional:T?,defaultValue:@autoclosure() -> T?) -> T
 */


//猜测一下？？ 的实现
func ?? <T>(optional:T?,defaultValue:@autoclosure() -> T) -> T{
    
    switch optional {
    case .some(let value):
        return value
    case .none:
        return defaultValue()
    }
}

//这类疑问是：为什么使用autoclosure，如果我们直接使用T，则意味着？？在取值前我们必须准备一个默认值传入到这方法中，如果是一个默认的值则没有什么问题，如果是通过一系列计算得到的可能会造成浪费，因为optional如果是非nil的话，我们实际上完全没有必要使用这个默认值。这样的开销完全可以避免，autoclosure就是将计算推迟到optional为nil之后。。。

// 注意的是：autoclosure并不支持带参数的写法，也就说形如 () -> T 的参数才可以用这个特性来简写！














