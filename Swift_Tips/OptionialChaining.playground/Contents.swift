//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// 可选链可以帮助我们摆脱不必要的判断和取值，但是在使用的时候需要小心,因为可选链随时会返回nil，所以使用可选链得到的都是optional的；

class Toy{
    
    let name : String
    init(name: String) {
        self.name = name
    }
}

class Pet{
    
    //1,
//    var toy : Toy
//    init(toy: Toy) {
//        self.toy = toy
//    }
    
    //2,
    var toy : Toy?
    
    
}

class Child{
    
    var pet : Pet?

}

let xiaoming = Child()
let tt = Toy(name:"amber")
let pp = Pet()
pp.toy = tt
xiaoming.pet = pp
print(xiaoming.pet?.toy?.name)

//我们可以看到name是Optional(“amber”)，这是因为Optional chaining中?.的时候都可能遇到nil提前返回nil，所以我们拿到的就是可选值
let name = xiaoming.pet?.toy?.name

//更经常使用的是这样的可选绑定
if let n = xiaoming.pet?.toy?.name{
    
    print(n)
}

// 复杂一点

extension Toy{
    
    func play() -> () {
       
    }
}

//如果小明有玩具就玩游戏
xiaoming.pet?.toy?.play()


//扩展一下，还有好多下盆友，把上面的抽象为一个闭包

let closure = {(child: Child) -> () in child.pet?.toy?.play()}
closure(xiaoming)
let mark = Child()
closure(mark)













