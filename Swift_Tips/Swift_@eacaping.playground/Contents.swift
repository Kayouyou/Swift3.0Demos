//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//swift 非常适合函数式编程，定义一个接收函数为参数的函数，使用闭包是比较常用的手段
func doWork(closure:() -> ()){
    
    closure()
    
    //我们可以将非逃逸的闭包转换为逃逸闭包
    withoutActuallyEscaping(closure) { escapingClosure in
        // 此时escapingClosure 就是逃逸的闭包了
    }
}

//尾随闭包
doWork { 
    print("work")
}




