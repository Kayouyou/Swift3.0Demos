//: Playground - noun: a place where people can play

import UIKit

//方法的嵌套，方法 在swift中时一等公民，也就说我们可以将方法当做变量后者参数来使用！

// 有时候我们因为一个方法主体很大很长，而不得不将它重构好几个小的功能块的方法，然后在原来的主体方法中去调用这些小方法，这些具体负责的一个个小功能也许就一辈子调用这么一次，但是却不得不存在于整个类型的作用域中；方法的嵌套其实也就是在func中嵌套另外的funcs，

//例如我们希望灵活地提供一个模板来让使用者通过模板定制他们想要的方法；但是另外一个方法我们又不希望暴露太多的实现细节，或者甚至是让使用者可以直接调用模板。
func makeIncrementor(addNumber:Int) -> ((inout Int) -> Void) {
    
    func incrementor(variable: inout Int) -> Void{
        
        variable += addNumber
    }
    
    return incrementor
}

//外部使用者可以调用，但是内部的实现确无法得知！
