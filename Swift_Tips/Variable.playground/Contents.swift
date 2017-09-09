//: Playground - noun: a place where people can play

import UIKit

// swift的可变参数函数
// 可变参数函数：直白点就是一个函数的参数可以用多个，在oc中很难写出可变参数的函数，但是在swift中得到前所未有的简化，只需要在函数的参数的后面加上...就可以了

func sum(input: Int...) -> Int{
    //输入的input在函数体内部被当做数组来使用，
    return input.reduce(0, +)
}

print(sum(input: 1,2,3,4,5))


//可变参数的位置不一定是最后一个，它的位置是随意的
//当然也有限制，就是一个函数只能有一个参数是可变的，可变参数的类型必须是同一种类型等；
//针对后一种变化，当我们想同时输入多个不同类型的参数时就需要做一些变通了