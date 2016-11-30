//
//  ViewController.swift
//  Swift_关联值
//
//  Created by 叶杨 on 2016/11/29.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit

//枚举 --- 关联值

enum LookupError:Error {
    case CapitalNotFound
    case PopulationNotFound
}
//扩展： 由于成功的关联值有可能是其他类型的值，所以应该用T 来代替,这样的话就不用限定成功的关联类型了
enum PopulationResult<T> {
    case Success(T)
    case Error(LookupError)
}

class ViewController: UIViewController {

       //我们可以像下文这样声明一个success
    let exampleSuccess: PopulationResult = .Success(1000)
    var cities : [String:Int]?
    var countries : [String:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //字典
        cities = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin": 3562]
        countries = ["French":"Paris","Japan":"Madrid","Holland":"Amsterdam","German":"Berlin"];
        
        //在调用populationOfCapital的时候，可以使用一个switch语句来确定函数对否成功
        switch populationOfCapital(country: "French") {
        case let .Success(population):
            print("French has population:\(population)")
        case let .Error(error):
            print("Error:\(error)")
        }
        
        //调用一个有throws的函数，可以嵌套在do 执行块中，然后加一个try的前缀，这样的好处是我可以在do的编写正常的流程，然后在catch中处理所有可能的错误
        do{
            let population = try populationOfCapitalOne(country: "Chinese")
            print("French has population:\(population)")
        } catch {
            print("LookupError:\(error)")
        }

    }
    
    //swift中可选值类型有一个缺点，当有错误发生时，我们无法获取相关信息，所以也无法判定到底哪里出错了，我们希望函数返回一个int或errortype 利用swift枚举就可以搞定这件事
    func populationOfCapital(country:String)-> PopulationResult<Any>{
        
        guard let capital = countries?[country] else {
            
            return .Error(.CapitalNotFound)
        }
        guard let population = cities?[capital] else {
            
            return .Error(.PopulationNotFound)
        }
        
        return .Success(population)
    }
    
    // Swift中的错误处理,swift强制你注明哪些代码可能抛出错误，且必须使用try来调用代码。如果使用PopulationResult类型的话，我们是无法再静态环境下确保错误被处理的。另外，swift内建的错误处理机制局限性在于，它必须借助函数的返回类型来触发：如果我们想构建一个函数，且提供的参数包含失败的情况，使用throw的方式提供这个参数，会让一切变得复杂起来，若是换成可选值或PopulationResult，编写起来就没有那么繁琐，处理起来也就更简单
    
    //1,使用swift throws重写 populationOfCapital 方法
    func populationOfCapitalOne(country:String) throws -> Int{
        
        guard let capital = countries?[country] else {
            
            throw LookupError.CapitalNotFound
//            return .Error(.CapitalNotFound)
        }
        guard let population = cities?[capital] else {
            throw LookupError.PopulationNotFound
//            return .Error(.PopulationNotFound)
        }
        
        return population
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

