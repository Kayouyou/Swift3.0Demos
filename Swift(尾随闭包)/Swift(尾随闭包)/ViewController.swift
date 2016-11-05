//
//  ViewController.swift
//  Swift(尾随闭包)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

/// 尾随闭包，以及简单的GCD
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //闭包回调传递数据,尾随闭包:如果函数的最后一个参数是闭包，那函数参数可以提前结束，最后一个参数直接使用{}来代替 包装闭包的代码
        
        //尾随闭包写法
        loadData { (result) in
            
            print("获取的新闻数据\(result)")
        }
        
        //原始的写法
        loadData(completion: { (result) -> ()  in
        
            print(result)
        
        })
        
        
        DispatchQueue.global().async { 
            
            //嵌套GCD异步时内部的嵌套的xcode不会自动转换为尾随闭包
            DispatchQueue.main.async(execute: { 
                
            })
            
            DispatchQueue.main.async{
                
            }
        }
        
    }

    //一般的异步函数呢都会使用逃逸闭包，就是逃脱这个函数，等到有结果是才调用这个闭包
    func  loadData(completion:@escaping (_ result:[String]) -> ()) -> () {
    
        //GCD基本语法
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            
            //休眠
            Thread.sleep(forTimeInterval: 1)
            
            //获取jason
            let json = ["头条","八卦","娱乐"]
            
            //主队列
            DispatchQueue.main.async {
                
                print("主线程更新UI\(Thread.current)")
                //回调执行 
                completion(json)
            }
        }
    }
    
   
    
    
    

}

