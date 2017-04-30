//: Playground - noun: a place where people can play

import UIKit


//交换两个数的值
//1，传统写法
func swap<T>(a: inout T,b : inout T){
    
    let temp = a
    a = b
    b = temp
}

//2,使用多元组重写
func swapTwo<T>(a: inout T,b : inout T){
    
    (a,b) = (b,a)
}
