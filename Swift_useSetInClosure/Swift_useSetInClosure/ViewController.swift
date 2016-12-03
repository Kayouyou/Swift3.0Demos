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
    
        // 6.1 for循环迭代打印出所有的前缀
        for prefix in PrefixSequence(string: "Hello") {
            
            print(prefix)
        }
        
        //6.2  我们还可以对它执行sequence提供的所有操作
        //让hello按大写依次打印出来
       let result = PrefixSequence(string: "hello").map{
            $0.uppercased()
        }
        print(result)
        
        
        //7,大部分的迭代器都是值语义的，如果你复制一份，迭代器的所有状态也都会被复制，这两个迭代器将会分别在自己的范围内工作，这是我们所期待的，标准库中的大部分迭代器也欧独具有值语义，不过也有例外存在
        let seq = stride(from: 0, to: 10, by: 1)
        var i1 = seq.makeIterator()
        _ =  i1.next()
        print(i1.next() ?? "")
        _ = i1.next()
        print(i1.next() ?? "")
        
        var i2 = i1
        _ = i1.next()
        _ = i1.next()
        print(i1.next() ?? "")
        _ = i2.next()
        _ = i2.next()
        print(i2.next() ?? "")
        
        //现在看一个不具有值语义的迭代器 AnyIterator 是一个对别的迭代器进行封装的迭代器，他爱可以用来讲原来的迭代器的具体了那些个抹消掉，如果你在创建公有的API的时候你想要将一个很复杂的迭代器具体的类型隐藏起来，二不暴露它的具体实现的时候，就可以使用这种迭代器，AnyIterator进行的封装的做法是将另外的迭代器包装到一个内部对象中，而这个对象是引用林习惯，
        
        var i3 = AnyIterator(i1)
        var i4 = i3
        
        //在这种情况下呢，院原来的迭代器和复制后的迭代器并不是独立的，因为实际的迭代器不再是一个结构体，AnyIterator中用来存储原来迭代器的盒子对象是一个类实例，当我们将i3赋值给i4的时候，只有对这个盒子的引用被复制了。盒子里的存储的对象将被两个迭代器所共享，所以任何对i3或者i4的进行的调用，都会增加那个相同的迭代器的取值
        print(i3.next())
        print(i4.next())
        //更多的时候我们是通过使用for循环隐士的进行创建的，你只用它来循环元素，然后将其抛弃，如果你发现你要与其他的对象共享一个迭代器的话，可以考虑将它封装到序列中，而不是直接使用它
        
        //8,基于函数的迭代器和序列
        /**
         AnyIterator还有一个初始化的方法，那就是直接接受一个next函数作为参数，与对应的AnySequence类型结合起来使用，我们可以做到不定义任何新的类型，比如我们可以通过一个返回AnyIterator的函数来定义斐波那契迭代器
        */
        
        _ = fibsIterator()
        
        //因为AnySequence提供一个初始化方法，可以接受返回值为迭代器的函数作为输入，所以创建序列就非常的容易了
        let fibsSequence = AnySequence(fibsIterator)
        print(Array(fibsSequence.prefix(10)))
        
        
        //9,另外一种方法是使用swift3.0中引入的sequence函数，这个函数有两个版本，首先使用sequence(first :next:)将使用第一个参数的值作为序列的首个元素，并使用next参数传入的闭包生成序列的后续元素，在下面的例子中，我们生成一个随机数的序列，其中每个元素都要比前一个小，直到到达0为止
        let randomNumbera = sequence(first: 100, next: { (previous:UInt32) in
            
            let newValue = arc4random_uniform(previous)
            
            guard newValue > 0 else{
                
                return nil
            }
            return newValue
        })
        print(Array(randomNumbera))
        
        //另外一个版本是sequence(state:next:)因为它可以在两次next闭包被调用之间保存任意的可变状态，所以他更强大一些，我们可以用它来通过一级一个单一的方法调用来构建出斐波那契序列
        let fibsSequence2 = sequence(state: (0,1)) { (state:inout(Int,Int)) -> Int? in
            let upcomingNumber = state.0
            state = (state.1,state.0 + state.1)
            return upcomingNumber
        }
        print(Array(fibsSequence2.prefix(10)))
        
        //以上两个返回值都是值类型，在函数式编程中这被称之为展开(unfold)，sequence和reduce对应，reduce将一个序列缩减为一个单一的返回值，而sequence是将唯一的值展开形成一个序列
        //这两个方法非常的有用，常用来代替传统的C风格的循环，特别是当下标步长不遵守线性关系的时候
        
        
        
        
    
    }
    
    //8.1,这个和上面自定义的斐波那契的迭代器只有一个功能的不同，那就是自定义的结构体具有值语义，二使用AnyIterator定义的没有
    func fibsIterator() -> AnyIterator<Int> {
        
        var state = (0,1)
        return AnyIterator{
            let upcomingNumber = state.0
            state = (state.1,state.0 + state.1)
            return upcomingNumber
        }
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











