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
        
        //1,oc的解决方法
        // weak 可能会在运行时被修改，它会被自定释放设置为nil
        // weak只能修饰var 丶修饰let，一旦被释放会自动设置为nil
//        weak var weakSelf = self
//        loadData {
//            
//            //！如果self已经被释放，强行解包会导致崩溃
//            //？可选解包 self被释放  不会向对象发送getter方法 不会导致崩溃
//            /*
//             weakSelf.view 只是单纯的发送消息，不参与计算
//             强行解包，因为需要计算，可选项不能直接参与计算
//            */
//            
//            print(weakSelf?.view ?? "对象释放了，self.view不存在")
//        }
        
        
        //2,swift 解决循环引用方法二
        //[weak self]表示闭包中的所有self都是弱引用，需要注意解包
        loadData { [weak self] in
            
            print(self?.view ?? "swift 解决循环引用问题")

        }
        
        //3,方法三 swift另一个解决循环引用的方法
        //[unowned self] 表示所有的self都是assign，不会强引用，但是对象释放，对象的指针地址指向不变，如果对象呗释放，继续调用就会引起野指针 ，这个方法不推荐使用
//        loadData { [unowned self] in
//            
//            print(self.view ?? "swift 解决循环引用问题")
//            
//        }

        
        
        
        
        
        
        
        
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

