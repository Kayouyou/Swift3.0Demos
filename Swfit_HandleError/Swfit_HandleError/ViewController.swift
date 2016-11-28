//
//  ViewController.swift
//  Swfit_HandleError
//
//  Created by 叶杨 on 2016/11/28.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit

//处理错误
/**
 Swift中提供了4中处理错误的方法，当一个函数抛出一个错误的时候，最重要的是能迅速的识别代码中会抛出错误的地方，为了标示，在调用一个能抛出错误的函数，方法，构造器之前加上try关键字！
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: throwing 传递错误
//只用throwing函数可以传递错误,在->之前添加throws关键字

struct Item {
    var price : Int
    var count : Int
}

class VendingMenchine {
    
    var inventory = [
    "Candy Bar": Item(price: 12, count: 7),
    "Chips" :Item(price: 10, count: 4)
    ]
    
    
    
    
    
}





