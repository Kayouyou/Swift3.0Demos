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

//怎么用swift复制以上部分的功能呢？

var string = ["hello","hallo","Hallo"]
string.sort{
    $0.localizedCaseInsensitiveCompare($1) == .orderedAscending
}
// 如果只是想用一个对象的某一个属性进行排序的话，也非常的简单

people.sorted {

    $0.yearOfBirth < $1.yearOfBirth
}

print(people)

// 我们先来尝试对多个属性进行排序，要同时排序姓和名，我们可以使用标准库额lexicographicalCoompare方法来进行实现；这个方法接收两个序列，也就说，这个比较将顺序从两个序列中各取一个元素类进行比较，直到发现不相等的元素；所以我们可以用姓和名构建两数组，然后使用lexicographicalCompare来比较他们，我们还需要一个函数来执行这个比较

people.sorted { (p0, p1) -> Bool in
    
    let left = [p0.last,p0.first]
    let right = [p1.last,p1.first]
    
    return left.lexicographicallyPrecedes(
    right){
     $0.localizedCaseInsensitiveCompare($1) == .orderedAscending
    }
}

//至此我们基本实现了原来的那个排序方法，不过有很大的改进空间，每次比较的时候都构建一个数组是非常满意效率的，比较操作是被写死的，而且使用方法我们经无法实现yearOfBirth的排序
// 函数作为数据，排序描述符其实是一种描述对象顺序的方式！我们现在不去将信息存在类里，而是尝试定义一个函数来描述对象的顺序，最简单的定义是获取两个对象，当它们的顺序正确的时候范湖true，这个函数的类型正是标准库中sort(by:)和sorted(by:)所接受的参数的类型，我们通过一个通用的typealiaes来描述排序描述符：
 typealias SortDescriptor<Value> = (Value,Value)-> Bool

//现在我们就可以比较person对象的描述符了，它可以比较出生年月，也可以比较姓的字符串

let sortByYear:SortDescriptor<Person> = {
    $0.yearOfBirth < $1.yearOfBirth
}

let sortByLastName:SortDescriptor<Person> = {
    $0.last.localizedCaseInsensitiveCompare($1.last) == .orderedAscending
}

//除了手写这些描述符之外，我们还可以创建一个函数来生成他们，将相同的属性写两次并不太好；而且描述符本身比较无聊的，为了避免复制我们定义一个函数，它和NSSortDescriptor大体相同，但是不涉及运行时编程的接口；这个函数接受一个键和一个比较方法，返回排序的描述符(这里的描述符将是一个函数，而不是NSSortDescriptor)。在这里key将不在是一个字符串，而是一个函数；要比较两个键，我们使用areInIncreasingOrder函数，最后的到是一个函数；


func sortDescriptor<Value,Key>(key:@escaping(Value) -> Key,_ areInIcreasingOrder:@escaping(Key,Key)->Bool) ->SortDescriptor<Value>{
    
    return { areInIcreasingOrder(key($0),key($1)) }
}

// 通过这个我们可以用另外一种方式来定义sortByYear
let sortByYearAlt:SortDescriptor<Person> = sortDescriptor(key: {
    $0.yearOfBirth
}, <)

people.sorted(by: sortByYearAlt)
print(people)

//我们还可以为所有的Comparable类型定义一个重载版本的函数
func sortedDescriptor<Value,Key>(key:@escaping (Value) -> Key) ->SortDescriptor<Value> where Key: Comparable{
    
    return {key($0) < key($1)}
}

let sortedByBirth:SortDescriptor<Person> = sortedDescriptor(key: {$0.yearOfBirth})

//上面的两个 sortDescriptor返回都是与布尔值相关的函数，NSSortDescriptor类有一个初始化方法，它接受类似locaizedCaseInsensitiveCompare这样的比较函数，这类函数将返回三种值(升，降，等于)





































