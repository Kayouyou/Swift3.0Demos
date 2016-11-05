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
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func  loadData() -> () {
    
        DispatchQueue.global().async {
            
            print("耗时操作\(Thread.current)")
            
            //主队列
            DispatchQueue.main.async {
                
                print("主线程更新UI\(Thread.current)")
            }
        }
    }
    
   
    
    
    

}

