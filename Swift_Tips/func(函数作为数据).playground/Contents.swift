//: Playground - noun: a place where people can play

import UIKit

// swift 将函数作为参数传递，swift的排序就很简单

let myArray = [3,4,2,1]
myArray.sorted()

// swift一共有四个排序方法： 1， 不可变的sorted() 2，可变的 sort(by:) 3,以及两者在待排序对象遵守comparable时进行升序操作的重载，重载方法意味着你可以通过简单的使用sorted（）来达到最简单的排序目的，如果你需要不同于默认升序进行排序的话，可以提供一个排序函数
myArray.sorted(by:>)


//及时待排序的元素不遵守Comparable，但是只要有> 操作符，你就可以使用这个方法进行排序，比如可选值就是一个例子
var numberStrings = [(2,"two"),(1,"one"),(5,"five")]
numberStrings.sort(by: >)
print(numberStrings)


// 我们还可以用更复杂的函数来按照你需要的计算标准进行排序；
let animals = ["elephant","tiger","chicken","duck","dog"]
animals.sorted { (lhs, rhs) -> Bool in
    
    let l = lhs.characters.reversed()
    let r = rhs.characters.reversed()
    return l.lexicographicallyPrecedes(r)
}

print(animals)

//最后swift的排序还有一个能力，它可以使用任意的比较函数，也就是那些返回NSComparisonResult的函数；来进行排序；这样swift排序就非常的强大了，而且它也使得这样的一个函数就够代替foundation框架中各种不同的排序方法的功能了；

// NSArray上的sorted(using：)方法非常的灵活，它可以很好的说明OC的动态特性的强大之处，对于selector和动态派发的支持在swift中被保留下来；但是标准库选择更倾向于基于函数的实现方法，我们一会展示把函数当做参数，以及把函数看做数据，所能够带同样的动态效果。
// 为了展示OC的强大运行时，我们定义一个NSobject的子类，在纯swift中使用结构体会是更好的选择

final class Person: NSObject{
    
    var first: String
    var last: String
    var yearOfBirth: Int
    init(first:String,last:String,yearOfBirth:Int) {
        self.first = first
        self.last = last
        self.yearOfBirth = yearOfBirth
    }
}

let people = [Person(first:"mark",last:"ye",yearOfBirth:1991),
Person(first:"lucy",last:"liu",yearOfBirth:1993),
Person(first:"jake",last:"wang",yearOfBirth:1994),
Person(first:"amber",last:"zhou",yearOfBirth:1995),
Person(first:"dream",last:"zhang",yearOfBirth:1990),]


//我们想要对数组进行排序，规则是先按姓排序，再按名排序，最后按出生年月，在排序的时候忽略大小写，并且使用用户的区域设置来决定顺序。我们可以通过NSSortDescriptor对象来描述如何排序对象，通过它可以表达出各个排序标准

let lastDescriptor = NSSortDescriptor(key: #keyPath(Person.last), ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))//忽略大小写
let firstDescriptor = NSSortDescriptor(key: #keyPath(Person.first), ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
let yearDescriptor = NSSortDescriptor(key: #keyPath(Person.yearOfBirth), ascending: true)

//对数组排序我们使用sortedArray(using:)方法；这个方法接收一系列的排序描述符，为了确定两个描述符的顺序，它会优先使用第一个描述符，如果第一个下两个元素相同，它就会使用第二个描述符，依次类推
let descriptors = [lastDescriptor,firstDescriptor,yearDescriptor]
(people as NSArray).sortedArray(using: descriptors)
print(people as Array)

//以上的排序描述符运用了OC的两个运行时特性：1，键路径key，以及键值编程，2，其次是selector方法，实际就是一个用来描述方法名字string，在运行时，这个selector将被变为用来比较两个对象的函数，对象上指定键所对应的值将用来进行比较










