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













