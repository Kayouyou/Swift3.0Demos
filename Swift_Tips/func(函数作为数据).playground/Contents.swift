//: Playground - noun: a place where people can play

import UIKit
import CoreLocation
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

func sortDescriptors<Value,Key>(key:@escaping(Value)->Key,ascending:Bool = true,_ comparator:@escaping (Key)->(Key)->ComparisonResult) -> SortDescriptor<Value>{

    return {
        
        lhs,rhs in
        let order:ComparisonResult = ascending ?.orderedAscending: .orderedDescending
        return comparator(key(lhs))(key(rhs)) == order
    }
}

// 到此我们就可以用简短清晰的多的方式来写sortByFirstName了；
let sortByFirstName:SortDescriptor<Person> = sortDescriptors(key: {$0.first}, String.localizedCaseInsensitiveCompare)
people.sorted(by: sortByFirstName)

print(people)
//现在SortDescriptor与 NSSortDescriptor拥有同样的表达能力，不过它是类型安全的，而且不依赖运行时编程；

//我们现在只能用一个单一的SortDescriptor函数对数组进行排序，我们曾用NSArray.sortedArray(using)方法来用一组比较运算符对数组进行排序。我们可以很容易地为Array，甚至是Sequence协议添加一个相似的方法，不过我们需要添加两个两次，一次是可变版本，另一次是不可变版本

//我们可以使用不同的策略，就可以避免添加多次的扩展，我们可以创建一个函数来将多个排序描述符合并为单个的排序描述符，它的工作方法和sortedAray(using)类型，首先它会使用第一个描述符，并检查比较结果，然后当结果相等时，再使用第二个；第三个描述符,直到用完

func combine<Value>(sortDescriptorArr:[SortDescriptor<Value>]) -> SortDescriptor<Value>{
    
    return {
        
        lhs ,rhs in
        
        for areIncreasingOrder in sortDescriptorArr {
            
            if areIncreasingOrder(lhs,rhs) {
                
                return true
            }
            
            if areIncreasingOrder(rhs,lhs) {
                
                return false
            }
        }
        return false
    }
}

// 使用这个新的描述符,最后我们可以把一开始的例子重写为这样:

let combined : SortDescriptor<Person> = combine(sortDescriptorArr: [sortByLastName,sortByFirstName,sortByYear])
people.sorted(by: combined)

//最终,我们得到了一个与foundation中的版本在行为和功能上等价的实现方法,但是这个方法要更加安全,也更加符合Swift的语言习惯,因为Swift版本不依赖与运行时,所以编译器有机会对它进行更好的优化,另外,我们也可以使用它来对结构体或非OC的对象进行排序

//这种方式的实质是将函数作为数据,我们将这些函数存储在数组里,并在运行时构建这个数组,浙江动态特性带到一个新的高度,这也是像swift这样的编译时就确定了静态类型的语言仍然能实现像是OC或者Ruby部分动态行为的一种方式


//函数作为代理

//1. foundation框架下的代理，针对类的
protocol AlertViewDelegate: class {
    
    func buttonTapped(atIndex:Int)
}

class AlertView{
    
    var buttons:[String]
    weak var delegate:AlertViewDelegate?
    init(buttons:[String] = ["OK","Cancel"]) {
        self.buttons = buttons
    }
    
    func fire(){
        delegate?.buttonTapped(atIndex: 1)
    }
}


//以上的模式对处理类的时候非常的好用，因为代理被标记为weak，所以我们不用担心引用循环：
class viewController: AlertViewDelegate{
    
    init() {
        
        let av = AlertView(buttons: ["OK","Cancel"])
        av.delegate = self
    }

    func buttonTapped(atIndex: Int) {
    
    }
}

//但是如果我们也想让结构体来实现代理协议，这是不可能的，因为这个协议针对的是类
//  结构体代理，我们放宽协议让它支持结构体，但是当使用类时很容易造成循环引用，使用结构体时原来的值不会改变，一句话在代理和协议的模式中并不适合使用结构体

protocol NewAlertViewDelegate {
  mutating  func buttonTapped(atIndex:Int)
}

// 正确的姿势应该是使用函数，而非代理
// 如果代理协议中只定义一个函数的话，我们完全可以用一个存储回调函数的属性来替换原来的代理属性；

class NewAlertView{
    
    var buttons:[String]
    var buttonTapped:((Int)->())?
    init(buttons:[String] = ["OK","Cancel"]) {
        
        self.buttons = buttons
    }
    
    func fire(){
        
        buttonTapped?(1)
        print("执行了")
    }
}

struct TapLogger{
    
    var taps:[Int] = []
    mutating func logTap(index: Int){
        taps.append(index)
        print("准备执行\(index),一共执行了\(taps.count)次")
    }
}

let av = NewAlertView()
var log = TapLogger()

// 会报错：不允许部分应用“可变”方法，
//av.buttonTapped = log.logTap

// 报错原因是：上面的赋值的结果不明确，是logger需要复制一份呢？还是buttonTap需要改变它的原来的状态呢？
// 修正这个错误：我们需要将赋值的右边用一个闭包封装起来，这让代码变得十分的清晰，我们想要捕获原来的logger变量（不是其中的值），然后我们将改变ta
//log.logTap(index: 2)

av.buttonTapped = { log.logTap(index: $0) }


av.fire()
av.fire()

//现在回调函数的名字是buttonTapped，而真正实现它的方法是logTap()

// 除使用方法外，我们还可以指定一个匿名函数
av.buttonTapped = { print("Button\($0)was tapped") }
av.fire()

// 当和类打交道时就需要注意了，我们有一些忠告，需要注意循环引用

class Test{
    
    func buttonTapped(atIndex:Int) {
        print(atIndex)
    }
}

let test = Test()
av.buttonTapped = test.buttonTapped

//上面的这个例子alertView 通过闭包强引用了test，但是test没有强引用alertView ，所以不存在引用循环

// 但是如果是test是controller，引用了alertView，使用这种方式非常的容易引起循环引用，需要避免需要在闭包中使用捕获列表:
av.buttonTapped = {
    
    [weak test] index in
    test?.buttonTapped(atIndex: index)
}

// inout 参数：我们在inout参数前使用&,它其实的作用是值传递，然后复制回来，并不是传递引用；

func increment(value:inout Int){
    
    value += 1
    
}

var i = 0
increment(value: &i)

//如果i是let，它就不能作为一个value了，因为我们不能改变let变量，所以将它用做inout也是没有意义的，我们只能使用那些可更改的value
let y: Int = 0
//会报错，因为let修饰的不能更改
//increment(value: &y)

//除了变量，我们还看传入其他的东西，举个例子：如果数组是用var标记的。我们可以传入数组小标:
var array = [1,2,3]
increment(value: &array[0])
print(array)

//实际上，对于所有的下标，只有它同时拥有get和 set方法，这都是适用的，类似的，我们也可以将属性值用于value，只要它们的get  set都被定义了
struct Point{
    
    var x : Int
    var y : Int
    private(set) var z :Int

}

var point = Point(x: 0, y: 0,z: 1)

increment(value: &point.x)

//如果一个属性只读的，只有get，我们将不能将其用于inout参数

extension Point{
    
    //计算属性，扩展里不能添加存储属性
    var squaredDistance:Int{
        return x*x + y*y
    }

}
//以下的代码会报错，因为不能给只用get的属性添加inout
//increment(value: &point.squaredDistance)

//由于 z是对内可读可写，对外是只读的属性，只读属性不能适用于inout属性1
//increment(value: &point.z)

//运算符也接收inout值，但是为了简化，在调用的时候我们不需要加上&符号，简单地使用lvalue就可以了，自增运算符在swift3.0倍移除了，但是我们可以把它加回来

postfix func ++(x:inout Int){
    
    x += 1
}

point.x++

//可变运算符甚至还可以与可选链一起使用，这不仅适用于普通的可选值，对字典下标也依然可用，
var dictionary = ["one":1]
dictionary["one"]?++

//在字典查找返回nil时，++ 操作符不会被执行
// 编译器可能会把inout变量优化成引用传递，而非传入和传出复制。不过文档已经很明确的支出我们不应该依赖inout的这个行为

// 嵌套函数和inout，嵌套函数中依然可以使用inout参数，swift依然保证它是安全的；但是你不能让这个inout参数逃逸，因为inout的值会在函数返回之前复制回去


// & 不意味 inout的情况
// 说到不安全，& 除了在将变量传递给inout之外，还可以用来将变量转换为一个不安全的指针；
// 如果一个函数接收unsafeMutablePointer作为参数，你可以用和inout参数类似的方法将一个var变量前面加上& 传递给它，在这种情况下，你确实在传递引用，更确切的说在传递指针;
func incref(pointer:UnsafeMutablePointer<Int>) ->()->Int{
    
    //将指针的复制存储在闭包中
    return {
        pointer.pointee += 1
        return pointer.pointee
    }
}

// swift的数组可以无缝隐士的退化为指针，这使得swift和C的一起使用的时候回非常的方便，现在假设你和上面类似的作用域情况下，传入一个数组
let fun:() -> Int

do{
    
    var array = [0]
    fun = incref(pointer:&array)
}
fun()
fun()
fun()
// 这个操作为我们打开了充满惊喜的未知世界的大门，在测试的时候，每次运行上面的代码都打印不同的值，想要搞清楚为什么，你需要明白你传进去的到底是什么，当你为一个惨数添加&时，你看调用的是安全swift的inout语义，你也可能把你可怜的变量强制转化为不安全的指针，当处理不安全的指针的时候，我们需要非常小心变量的生命周期！

// 计算属性和下标
struct GPSTrack{
    
    //内部可读写 private(set)
     var records:[(CLLocation,Date)] = []
}

//想要获取GPS追踪所有记录的日期值，我们可以添加一个计算属性
extension GPSTrack{

    var dates:[Date]{
        return records.map{$0.1}
    }
}

//因为我们没有指定setter，所以dates只能是只读的，它的结果不会被缓存，每次当你调用dates属性时，结果会被计算一遍，



































