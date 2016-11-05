//
//  ViewController.swift
//  Swift(循环引用)
//
//  Created by 叶杨杨 on 2016/11/5.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// swift循环引用问题

class ViewController: UIViewController {

    //声明一个可选的闭包属性
    var completionCallBack:(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //block中出现self，需要注意
        //这个地方只是闭包对self的copy,闭包执行完毕会自动释放，同时对self的引用会释放
        loadData {
            
            print(self.view)
        }
    }

    func loadData(completion:@escaping ()->()) -> () {
       
        //使用属性记录闭包，意味着self对闭包引用了
        completionCallBack = completion
        
        
        //异步
        DispatchQueue.global().async { 
            
            //主线程
            DispatchQueue.main.async(execute: { 
                
                //执行闭包
                completion()
                
            })
        }
    }
    
    //类似于OC的dealloc方法
    deinit {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

