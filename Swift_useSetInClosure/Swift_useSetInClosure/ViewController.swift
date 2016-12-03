//
//  ViewController.swift
//  Swift_useSetInClosure
//
//  Created by 叶杨杨 on 2016/12/2.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//


/// 1,闭包中使用集合

/// 2,Sequence 协议是集合类型结构的基础，一个序列代表一系列具有相同类型的值，你可以对这些值进行爹迭代，遍历一行序列最简单的方法是就是for循环
import UIKit

///3,Sequence的定义
//protocol Sequence {
//    
//    associatedtype Iterator: IteratorProtocol
//    func makeIterator() -> Iterator
//}

///4,序列是通过创建一个迭代器提供元素的访问，迭代器每次都产生一个序列的值，并且当比那里序列时对比那里状态进行管理
//此协议中唯一的方法就是next()，这个方法需要在每次被调用时返回序列的下一个值，当序列被耗尽的时候next()返回nil
//protocol IteratorProtocol {
//    
//    associatedtype Element
//    mutating func next() -> Element?
//}

///5,一般来说只有在想要实现一个你自己的自定义序列类型的时候，才需要关心迭代器，除此之外，你几乎不会直接使用它，实际上for循环背后帮我们所做的事：编译器会为序列创建一个新的迭代器并且不断调用迭代器的next的方法，直到它返回nil为止

/**
 实际上for循环其实是这段代码的一种简写形式
  var iterator = someSequence.makeIterator()
  while let element = iterator.next(){
     doSomething(with：element)
 
  }
 */

/// 斐波那契序列
// 它将记录两个数字，并作为状态储存，next函数作的事情是为接下来的调用更新这个状态，并且返回第一个数
//struct FibsIterator:IteratorProtocol {
////    typealias Element = Int
//    
//    var state  = (0,1)
//    mutating func next() -> Int? {
//      let upcomingNumber = state.0
//        state = (state.1,state.0 + state.1)
//        return upcomingNumber
//    }
//}

///6,遵守序列协议,我们可以创造有限序列的迭代器，下面的例子就是按顺序生成字符串的所有前缀（包含字符串本身）它从字符串的开头开始，每次调用next时，会返回一个追加之后的一个字符的字符串切片，知道达到整个字符串尾部为止

struct PrefixIterrator:IteratorProtocol {
    
    let string : String
    var offset : String.Index
    
    init(string: String) {
        
        self.string = string
        offset = string.startIndex
    }
    
    mutating func next() -> String? {
        
        guard offset < string.endIndex else {
            return nil
        }
        
        offset = string.index(after: offset)
        return string[string.startIndex..<offset]
    }
}

//有了迭代器，定义一个PrefixSequence了那些个就很容易了，和之前一样，我们不需要指明关联类型iterator的具体类型，因为编译器可以从makeiterator方法的返回类型中自己推断出来
struct PrefixSequence: Sequence{
    
    let string : String
    
    func makeIterator() -> PrefixIterrator {
        
        return PrefixIterrator(string: string)
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //for循环迭代打印出所有的前缀
//        for prefix in PrefixSequence(string: "Hello") {
//            
//            print(prefix)
//        }
        
        //我们还可以对它执行sequence提供的所有操作
        //让hello按大写依次打印出来
       let result = PrefixSequence(string: "hello").map{
            $0.uppercased()
        }
        print(result)
        
        
    }
    

}

//扩展序列协议,实现筛选出唯一的元素，而又保证顺序
//“[1,2,3,12,1,3,4,5,6,4,6].unique() // [1, 2, 3, 12, 4, 5, 6]
extension Sequence where Iterator.Element:Hashable{
    func unique() -> [Iterator.Element] {
        var seen:Set<Iterator.Element> = []
        return filter{
            if seen.contains($0){
                return false
            }else{
                seen.insert($0)
                return true
            }
        }
    }
}

protocol Animal  {
    
    associatedtype Ediblefood
    associatedtype SupplementKind
    
    
    
    
    
    
}











