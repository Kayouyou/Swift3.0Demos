//: Playground - noun: a place where people can play

import UIKit


// Result类型:它其实和可选值非常的相似,可选值就是有两个成员的枚举：一个包含关联值得.none或者nil，以及一个包含关联值得some，Result类型也是两个成员组成的灭局：一个代表失败的情况，并关联了具体的错误值；另一一个代表成功的情况，它也关联了一个值；和可选值类似，Result也有一个泛型参数:

enum Result<A>{
    case failure(Error)
    case success(A)
}

//现在我们定义一个enum来表示可能出现的错误情况
enum FileError:Error {
    
    case fileDoseNotExist
    case noPermission
}

//swift抛出和捕获异常
func contents(ofFile fileName:String)throws -> String{

    // 下面是伪代码，只是示范defer的使用场景之一
//    let file = open("test.text")
//    defer {
//        close(file)
//    }
    
    
    
    return "temp";
}

// 现在我们需要对contents的调用标记为try，否则我们无法编译,关键字try有两个目的：
// 第一：对于编译器来说这是一个信号，表示我们知道我们将要调用函数可能会抛出错误
// 第二：它可以让读者知道代码中哪个函数可能会抛出异常
// 调用一个可以抛出的函数，编译器迫使我们去考虑如何处理可能的错误，我们选择do catch来处理错误！

do {
    let res = try contents(ofFile: "temp.text")
} catch FileError.fileDoseNotExist {
    
    print("file not found")
} catch{
    
    print(error)
}

// 由于swift的错误是无类型的，所以说明就显得很重要；

// 错误处理实例

enum LoginError:Error{
    
    case UserNotFound,UserPWDNotMatch
}

// throws标记后，调用必须使用do catch
func login(usr:String,passWord:String) throws{
    
    let users = ["mark":"123","lucy":"456"]

    if !users.keys.contains(usr) {
        
       throw LoginError.UserNotFound
    }
    
    if users[usr] != passWord {
        
        throw LoginError.UserPWDNotMatch
    }
    print("login successfully")
}

do {
    try login(usr: "jim", passWord: "123")
} catch LoginError.UserNotFound {
    print("用户不存在")
} catch LoginError.UserPWDNotMatch{
    print("用户密码错误")
}
catch{
    print("未知错误")
}

// swift的异常机制并不是十全十美的，最大ed问题是类型安全，不借助于文档，我们无法得知所抛出的异常的类型；
// 另外一个限制是：对于非同步的API来说，抛出异常是不可用的，异常只是一个同步方法中专用的处理机制；
// 一种比较常见的方法是借助于enum,作为swift的一个重要特性，枚举类型现在可以与其他的实例进行绑定的，我们还可以返回枚举类型，然后在枚举类型中定义成功和错误的状态，并分别将合适 的对象与枚举值进行挂关联：

func doSomethingParam(param:AnyObject)-> Result<String>{
    
    // 做一些操作
    
    let success = false
    
    if success {
        
        return Result.success("成功了")
    }else{
        
        return Result.failure(FileError.fileDoseNotExist)
    }
    
}

// 使用时，利用switch 的let来从枚举值中将结果取出即可:
class man{
    
    init() {
    }
}

let m = man()
let result = doSomethingParam(param:m)
switch result {
case let .success(ok):
    
    print(ok)
    
case let .failure(error):
    
    print(error)
}

// 对于swift中的错误处理我们更加清晰一层：对于同步API使用异常机制；对于异步的API使用泛型枚举；

// 关于try和throws 扩展：
// try ：try!表示强制执行，这代表你确定知道这次调用不会抛出异常；如果在调用中出现了异常，你的程序就会崩溃；这和我们使用optional值用！进行强制解包的行为是一致的。另外我们也可以在try后面加上？来进行尝试性的运行，try？会返回一个Optional的值，如果运行成功，没有抛出异常的话，它会包含这个语句的返回值，否则将为nil，和其他的返回的Optional的方法类似，一个典型的try？的应用场景和if let这样的语句搭配使用的，不过如果你用了try？的话，这就意味着你无视了错误的具体类型：
enum E:Error{
    case Negative
    
}

func methodThrowsWhenPassingNegative(num :Int) throws -> Int{
    
    if num < 0 {
        throw E.Negative
    }
    
    return num
}

if let number = try? methodThrowsWhenPassingNegative(num: 10) {
    
    print(type(of: number))// 这里是 Optional<Int>
}else{
    print("failed")
}

// 值得一提的是在一个可以throw的方法里，我们永远不应该返回一个optional的值，因为try?使用的话，这个Optional的返回值会被再次的包装一层的Optional，使用双重的可选值是非常容易产生错误的，也十分的费解！


// 还有一个关键字 rethrows，其实它和throw做的事情没有太多的不同，但是rethrows一般用在参数中含有可以throws的方法的高阶函数中，来表示它既可以接收普通函数，有额可以接收一个能throws的函数作为参数，

func methodThrows(num: Int) throws {
    
    if num < 0 {
        
        throw E.Negative
    }

}


func methodRethrows(num: Int,f:(Int) throws -> ()) rethrows{
    
    try f(num)
}

do {
    try methodRethrows(num: 1, f: methodThrows)
} catch _ {
    
}

// 在这种情况下，我们把rethrows改为throws这段代码依然可以执行，但是他们还是有区别的；简单的理解你可以吧rethrowss当做throws的子类，它可以用来重载那些被标记为throws的方法或者参数，或者用来满足被标记为throws的协议，但是反过来不行；如果你拿不准怎么使用的话，就请先记住你要在throws另外一个throws时，应该将前者改为rethrows。这样在不失灵活性的同时保证代码的可读性和准确性，标准库中的map,reduce等函数式特点鲜明的函数都采用retrowsde 方式来扩展使用范围


// 桥接错误

// OC中的NSError参数被导入了Error协议，所以一般来说你不再需要直接和NSError打交道了，因为Error只有一个属性，那就是localizedDescription，对于纯swift的错误，这个属性没有被重写，运行的时候将从错误类型名中生成一个默认的文本描述；如果你想要这些错误值展示给用户的话，通过重写这个属性来提供有意义的描述会是更好的实践！

// 如果你将一个纯swift的错误传递给OC的方法，类似地，它将被桥接为NSError，因为所有的NSError对象必须有一个domain字符串和一个整数的错误代码code，运行时将提供默认值，它会使用类型名作为domain的名字，使用从0开始的枚举的序号作为错误代码。如果有需要，你也可以让你的错误类型遵守CustomNSError协议来提供更好的实现。

// 比如，我们可以扩展ParseError:

enum ParseError: Error{
    
    case wrongEncoding
    case warning(line:Int,message:String)
}

extension ParseError:CustomNSError{
    
    static let errorDomain = "io.objc.parseError"
    
    var errorCode:Int{
        
        switch self {
        case .wrongEncoding:
            return 100
        case .warning(line: _, message: _):
            return 200
        }
    }
    
    var errorUserInfo: [String: Any]{
        
        return [:]
    }
}

//类似地，你可以实现下面的协议，来让你的错误拥有更有意义的描述，并更好的遵循Cocoa的习惯

// LocalizedError 一个提供一个本地化的信息，来表示错误为什么发生，从错误中恢复的提示，以及额外的帮组文本
// RecoverableError 描述一个用户可以恢复的错误，展示一个或多个recoveryOptions，并在用户要求的时候执行恢复

// 错误和函数参数

extension Int{
    
    var isPrime: Bool{
        
        if self < 2 {
         
            return false
        }
        return true
    }
}

func checkPrimes(_ numbers:[Int]) -> Bool{
    
    for  number in numbers {
        
        guard number.isPrime else {
            return false
        }
    }
    return true
}

checkPrimes([1,2,3])
checkPrimes([2,3,4])

// 以上的函数是对于序列的迭代，与实际决定一个元素是否满足条件的逻辑进行混合，对于这种模式，类似于map或者filter，我们可以创建一个抽象的函数出来;我们可以为sequence添加一个all的函数，接收一个执行条件判断是否满足的函数作为参数；返回的是bool值

//extension Sequence{
//    
//    func all(condition:(Iterator.Element) -> Bool) -> Bool {
//        
//        for element in self {
//            
//            guard condition(element) else {
//                
//                return false
//            }
//        }
//
//        return true
//    }
//}


//  如果我们传入的是一个可以抛出异常的的闭包呢？
// 使用rethrows,可以避免写出两个版本的all，rethrows可以高数编译器这个函数只会在它的参数函数抛出错误的时候抛出错误，对于那些向函数中传递的是不会抛出错误的check函数的调用，

extension Sequence{
    
    func all(condition:(Iterator.Element) throws -> Bool) rethrows -> Bool {
        
        for element in self {
            
            guard try condition(element) else {
                
                return false
            }
        }
        return true
    }

}

func checkIsPrime2(_ numbers:[Int]) -> Bool{
    
    return numbers.all(condition: { (ele) -> Bool in
        
        return ele.isPrime
    })
}

checkIsPrime2([2,2,3])

// defer 进行清理工作
// 其实很多的语言有try finally这样的结构，其中finally所围绕的代码块是将一定会在函数返回时被执行，而不论最后是否有错误被抛出！swift中的defer和它类似，但是具体的做法稍微不同，defer会在作用域结束时被执行，而不管作用域结束的原因是什么，defer与finally不一样ed地方在于前者不需要再之前出现try或do这样的语句；你可以很灵活的把它放在代码需要的位置：

// 比如在contents方法中添加defer操作，

// 标准库多次在需要给一个计数器加一并且返回这个计数器之前的值得时候使用了defer，这让我们不用为了返回值而去特意的创建一个本地变量，这种情况下defer本质上等同于已被移除的后自增运算符（i++）

/**

struct EnumeratedIterator<Base: IteratorProtocol>: IteratorProtocol, Sequence {
    internal var _base: Base
    internal var _count: Int
    ...
    func next() -> Element? {
        guard let b = _base.next() else {

            return nil
        }
        defer { _count += 1 }
        return (offset: _count, element: b)
    }
}

*/

// 如果相同的作用域中有多个defer块，它们将被按照逆序执行，你可以吧这种行为现象为一个栈，一开始，你看你会觉得逆序执行的defer很奇怪；
// 伪代码示例：

/**
 
guard let database = openDatabase(...)else {
    return
}
defer {
    closeDatabase(database)
}
guard let connection = openConnection  else {
    return
}
defer {
    closeConnection(connection)
}
guard let result = runQuery(connection) else {
    return
}

*/

// 打个比方：在runQuery的时候发生了错误，我们首先要先断开与数据库的链接，然后关闭数据库，因为defer是逆序执行的，所以一切都显得很自然，defer逆序清理！
// 有些情况下你的defer可能会没有被调用，当你的程序遇到一段错误，或者发生严重的错误或强制解包一个nil，所有的执行都将会被立即挂起！














