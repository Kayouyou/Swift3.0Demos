//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MARK:创建一个计算相加的方法
//1，常规计算一个相加的方法
func addOne(num: Int) -> Int {
    
    return num + 1
}

let addTwo = addOne(num: 3)

//如果我们想让方法通用，想让这个数字后续可以加8 或加10等操作呢
func addTo(_ adder: Int ) ->(Int) ->Int{
    
    return {
        num in
        return num + adder
    }
}

//返回的一个方法
let addThree = addTo(2)
print(addThree)

//在之前基础上添加一个数字
let result = addThree(6)

//2,创建一个比较大小的方法

func greaterThan(_ comparer:Int) -> (Int) -> Bool{
    
    return { $0 > comparer }
}

let greaterThanTen = greaterThan(10)

let result =  greaterThanTen(13)





