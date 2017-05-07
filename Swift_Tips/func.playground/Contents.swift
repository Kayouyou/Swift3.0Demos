//: Playground - noun: a place where people can play

import UIKit

// swift中func中的参数其实默认是不可变的let，如果你想在方法中改变func中的参数,inout表示
func increment(variable: inout Int){
    
    variable += 1
}

//因为在内部已经修改了，所以不需要return了,调用时需要加上&
var luckyNum = 10
increment(variable: &luckyNum)
print(luckyNum)

//最后，函数参数的修饰是具有传递限制的，就是说对越过层级的调用，我们需要保证同一参数的修饰是统一的，比如我们想扩展一下上面的方法，实现一个可以累加任意数的的+N的器的话
func makeIterator(addNUmber:Int) -> ((inout Int) ->()){
    
    func incrementor(variable:inout Int)-> (){
        variable += addNUmber
    }
    
    return incrementor
}

var ie =  makeIterator(addNUmber: 5)
var temp = 10
ie(&temp)

