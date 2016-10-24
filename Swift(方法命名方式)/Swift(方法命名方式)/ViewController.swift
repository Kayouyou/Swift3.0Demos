//
//  ViewController.swift
//  Swift(方法命名方式)
//
//  Created by 叶杨杨 on 2016/10/24.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

/*
 1,swift 2.0 之前
 [string dataUsingEncoding:NSUTF8StringEncoding];
 
 2,swift 2.2 
 string.dataUsingEncoding(NSUTF8StringEncoding)
 
 3,swift 3.0
 strin.data(using:.uft8)
 
 swift的命名准则就是尽量的简单明了
 相关链接：http://www.swift.gg/2016/10/20/swifty-delegates/

 */




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

