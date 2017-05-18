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










