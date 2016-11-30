//
//  ViewController.swift
//  Swift_关联值
//
//  Created by 叶杨 on 2016/11/29.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit


//枚举 --- 关联值
class ViewController: UIViewController {

    enum LookupError:Error {
        case CapitalNotFound
        case PopulationNotFound
    }
    enum PopulationResult {
        case Success(Int)
        case Error(LookupError)
    }

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
        
    }
    
    //swift中可选值类型有一个缺点，当有错误发生时，我们无法获取相关信息，所以也无法判定到底哪里出错了，我们希望函数返回一个int或errortype 利用swift枚举就可以搞定这件事
    func populationOfCapital(country:String)-> PopulationResult{
        
        guard let capital = countries?[country] else {
            
            return .Error(.CapitalNotFound)
        }
        guard let population = cities?[capital] else {
            
            return .Error(.PopulationNotFound)
        }
        
        return .Success(population)
    }

}

