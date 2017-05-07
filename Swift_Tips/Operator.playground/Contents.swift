//: Playground - noun: a place where people can play

import UIKit

//: 1，如果系统的操作符不能满足我们的需求，我们可以重载

struct Vetor2D{
    
    var x = 0.0
    var y = 0.0
}

//自定义操作符，直接写会报错！必须先定义，告诉编译器它是操作符！
precedencegroup DotProductPrecedence{ //定义一个操作符的优先级别，跟定义属性相似的
    
    associativity: none                  //结合律，常见的加减都是left，这里是点乘，不会和其他的点乘结合使用，所以是none
    higherThan: MultiplicationPrecedence //优先级，这里是优先于乘法运算的，同时也支持lowerThan
}

// infix：表示要定义一个中位的操作符，即前后都是输入，其他修饰符包括：prefix，postfix
infix operator +*:DotProductPrecedence

// 操作符具体实现
func +*(left:Vetor2D,right:Vetor2D) -> Double{
    
    return left.x * right.x + right.y * right.y
}

// 实际使用
v1 = Vetor2D(x:1.0,y:3.0)
v2 = Vetor2D(x: 4.0, y: 6.0)
let result = v1 +* v2


// 需要注意的：自定义操作符在swift中是不能定义在局部域中的，因为至少希望你在全局范围内使用您的操作符，否则您的运算符也就失去了意义；
// 另外来自不同moudle的操作符有可能会冲突的，这对库开发者而言是需要特别注意的！所以在使用或者重载运算操作符时，请权衡利弊思考再三！

