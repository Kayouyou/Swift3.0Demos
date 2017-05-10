//: Playground - noun: a place where people can play

import UIKit

//1,命名空间
// oc中没有命名空间，所以命名时会到上两到三个的前缀，swift使用了命名空间，即使名称一样，只要来自不同的module都可以和平共处的！
// swift中的命名空间是基于module的，而不是代码中显示的声明的，每个module代表了一个命名空间，也就说同一个target中的类型名称还是不同相同的，


//2,typealias
// 它是用来为已经存在的类型重新定义名字的；通过命名可以使代码更加清晰；

typealias Location = CGPoint
typealias Distance = Double

//泛型中引入别名
class Person<T>{

}

typealias Worker<T> = Person<T>


//3, 另外一个使用场景是，某个类型同时实现了多个协议组合的时候，我们可以使用&来链接几个协议，
protocol Cat{}
protocol Dog{}

//给它一个更加易读的名字，增强代码可读性！
typealias Pat  = Cat & Dog

