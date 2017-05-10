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


//4,associatedtype，关联类型
//swift中协议中可以定义方法和属性
protocol Food{}

protocol Animal{

    //实际上协议中我们还可以定义类型的占位符，让实现协议的类型来指定具体的类型；
    //使用associatedtype可以加一个限定，让具体实现协议的动物指定具体的食物类型；
    associatedtype F
    func eat(_food: F) //后面的{} 加不加都OK的
}

struct Meat: Food{}
struct Grass: Food{}

//由于老虎是不吃素食的，怎么在编译的时候就确保这一条件呢
struct Tiger:Animal{
    
    //在Tiger实现animal了协议之前，animal根本不关系F是什么类型，只需要F 和 eat参数中的类型一致即可；
    //tiger中只要实现了正确的eat，就会自耦东推断出F是meat，所以无需指定 F = Meat
    func eat(_food: Meat) {
        
    }
}


// 需要注意的是： 添加了关联类型后，Animal协议就不能当做独立的类型使用了，试想我们有一个函数来判断动物的类型是否危险？
//❌ 写法

 
//func isDangerous(animal:Animal) -> Bool{
//    
//    if animal is Tiger {
//        return true
//    }else{
//        return false
//    }
//}


// 如果直接向上面这样写，xcode会报错，说当一个协议加入了泛型associatedtype或者 self的约束后，它只能用来泛型约束，而不能作为独立的类型的占位使用了；也失去了动态派发的特性；

// 导致以上报错的原因是： swift需要在编译的时候就确定所有的类型，这是因为animal包含了一个不确定的类型，所以随着animal本身类型的的变化，其中的F 将无法确定（eat参数你无法确定的），

//解决办法是，我们只能将以上的函数改为泛型约束！

func IsDangerous< T:Animal>(animal:T) -> Bool{
    
    if animal is Tiger {
        return true
    }else{
        return false
    }
}

IsDangerous(animal: Tiger())










