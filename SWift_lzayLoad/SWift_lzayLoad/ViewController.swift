//
//  ViewController.swift
//  SWift_lzayLoad
//
//  Created by 叶杨杨 on 2016/11/14.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// swift 懒加载
class ViewController: UIViewController {

    //正常的声明属性
//    var label: DemoLable?
    
    //懒加载
    /**
     1,能够延迟加载
     2，最大的好处就是可以解除解包的烦恼，后面不用？ ！不用担心他没有值
    */
    lazy var label:DemoLable = DemoLable()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

