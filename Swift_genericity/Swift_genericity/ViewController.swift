//
//  ViewController.swift
//  Swift_genericity
//
//  Created by 叶杨杨 on 2016/11/28.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// swift map函数的推倒
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    //根据数组的参数得到一个新的数组
    func computerIntArray(xs:[Int],transform:((Int) -> Int)) -> [Int] {
    
        var result: [Int] = []
        for x in xs{
            
            result.append(transform(x))
        }
        return result
    }
    
    func doubleArray2(xs:[Int]) -> [Int] {
        
        return computerIntArray(xs: xs, transform: { (x) -> Int in
            x * 2
        })
    }
    
    //以上的例子扩展性不够好，原因是如果我们想定义一个 int-> bool 类型的函数，重写一个很low
    //很幸运的是我们可以运用泛型来解决这个问题
    //类型参数T 的每个悬着都会确定为一个新函数，
    func genericComputerArray<T>(xs:[Int],transform:((Int) -> T)) -> [T] {
        
        var result:[T] = []
        for x in xs {
            result.append(transform(x))
        }
        return result
    }
    
    //以上数组我们能进一步的优化，没有理由让它仅能对【int】的输入数组进行处理，将数组进行抽象，能得到下面这样的类型签名
    
    func map<Element,T>(xs:[Element],transform:(Element) -> T) -> [T] {
        
        var result : [T] = []
        
        for x in xs {
            
            result.append(transform(x))
        }
        
        return result
    }
    
  
}

//实际上比起定义一个顶层map函数，按照swift的惯例将map定义为array的扩展会更合适
//其实swift标准函数库中已经定义了这样的一个函数，它实际上基于SequenceType协议被定义的
extension Array{
    
    func map<T>(transform:(Element) -> T) -> [T] {
        
        var result :[T] = []
        for x in self{
            result.append(transform(x))
        }
     
        return result
    }
}


