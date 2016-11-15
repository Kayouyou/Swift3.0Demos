//
//  ViewController.swift
//  Swift_计算属性(setter,getter)
//
//  Created by 叶杨杨 on 2016/11/15.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// 计算属性 setter  getter 
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let p = Person()
        
        p.name = "老王"
        print(p.name)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

