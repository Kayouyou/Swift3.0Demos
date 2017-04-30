//: Playground - noun: a place where people can play

import UIKit

// Sequence ，swift中所有的for in都可以使用在实现了sequence的类型中，事项sequence你首先需要实现一个iteratorProtocol协议，

//下面我们实现一个反向的iterator和sequence


// first step  先实现一个IteratorProtocol的协议类型

class ReverseIterator<T>:IteratorProtocol{
    
    //首先你得有一个typealias element类型
    
    typealias Element  = T
    var array:[Element]
    var currentIndex = 0
    
    init(arry:[Element]) {
        
        self.array = array
        currentIndex = array.count - 1
    }
    
    //其次必须实现一个next的方法，返回elemnet？
    func next() -> Element? {
        
        if currentIndex < 0 {
            return nil
        }else{
            let  element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}


//second step 实现一个sequence

struct ReverseSequence<T>:Sequence{
    
    //首先我们必须有一个tepealias iterator
    typealias Iterator = ReverseIterator<T>
    
    var array :[T]
    
    init(array:T) {
        
        self.array = array
    }
    
    
    //其次我们必须实现一个makeIterator的方法，返回的是Iterator？类型
    
    func makeIterator() -> ReverseIterator<T> {
        
        return ReverseIterator(arry: self.array)
    }
}


//实际使用

let arr = [1,2,3,4]
for i in  ReverseSequence(arr){
    
    print(i)
}

//我们会得到 4 3 2 1 
//如果我们想知道for in 干了什么，大概是这样的
/**
 
 var iterator = arr.makeIterator()
 while let obj == iterator.next() {
 
 print(obj)
 
 }
 
 */












