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
        
        //闭包回调传递数据
        loadData { (result) in
            
            print("获取的新闻数据\(result)")
        }
    }

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

