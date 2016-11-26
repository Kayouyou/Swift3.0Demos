//
//  ViewControllerB.swift
//  Swift_Initializer
//
//  Created by 叶杨 on 2016/11/26.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit


/// 类的继承和构造过程
/**
 类的所有的存储属性-包括所有的继承自父类的属性-都必须在构造过程中设置初始值
 Swift中提供了两中构造器来确保实例中的所有的存储属性都能获得初始值，他们分别是制定构造器和便利构造器
 */
class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: 类的构造器代理规则
/**
 为了简化制定构造器和便利构造器之间的调用关系，Swfit采用以下三条规则来限制构造器之间的调用！
 1，指定构造器必须调用器直接父类的指定构造器。
 2，便利构造器必须调用同类中定义的其他构造器。
 3，比那里构造器必须最终导致一个指定构造器被调用。
 
 指定构造器必须向上代理
 便利构造器必须横向代理

 */

// MARK: 两段式构造过程  p190
/**
 Swift中类的构造过程包括两个阶段
 A：每个存储类型属性被引入他们的类指定一个初始值，当每个存储属性的初始值确定后，第二阶段开始
 B：它给每个类一个机会，在新实例准备使用之前进一步定制他们的存储属性
 
 作用：让构造过程更加的安全，同时在整个类型的层级结构中给予每个类完全的灵活性，两段式构造过程可以防止属性初始化之前被访问，也可以防止被另外一个构造器意外的赋予不同的值

 */


// MARK:构造器的继承和重写
/**
 当你在编写一个和父类中指定构造器相匹配的子类构造器时，你实际上是在重写父类的这个指定构造器，因此你必须在定义子类构造器时带上override关键字，及时你重写的是系统自动提供的默认构造器，也需要带上override修饰符，
 正如重写属性，方法或下标，override修饰符会让编译器去检查父类中是否有相匹配的指定构造器，并验证构造器参数是否正确
 子类可以在初始化时修改继承来的变量属性，但是不能修改继承来的常量属性
 */

//MARK:构造器的自动继承
/**
 子类在默认情况下不会继承父类的构造器，但是如果满足条件，父类构造器就可以自动被继承
 1：如果子类没有定义任何指定构造器，它将自动继承所有父类的指定构造器
 2：如果子类提供了父类指定构造器的实现，- 无论是规则1继承的还是提供了自定义实现，-它将自动继承所有父类的便利构造器
 */

//实例
class Food{
    
    var name : String
    init(name:String) {//指定构造器
        
        self.name = name
    }
    
    convenience init(){//便利构造器
        self.init(name:"[Unnamed]")
    }
}

//此类有三种构造器都可以用来创建新的Recipelngredient实例

class Recipelngredient: Food {
    
    var quantity: Int
    
    init(name: String,quantity: Int) {//指定构造器
        
        self.quantity = quantity
        super.init(name:name)
    }
    //由于便利构造器使用了跟Food中指定的构造器相同的参数，因此必须在前面使用override修饰符
    override convenience init(name:String){
        
        self.init(name:name,quantity:1)//便利构造器只是简单的横向代理类中指定的构造器
    }
}


// MARK:可失败构造器

/**
 如果一个类，结构体，枚举对象，在构造过程中可以失败，语法就是在init后加一个?
 */

struct Animals {
    
    let species: String
    
    init?(species: String){
        
        if species.isEmpty {
            return nil
        }
        
        self.species = species
    }
}


// MARK: 枚举类型可失败构造器
enum TemperatureUnit{
    
    case Kelvin,Celsius,Fahrenheit
    init?(symbol:Character) {
        
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}














