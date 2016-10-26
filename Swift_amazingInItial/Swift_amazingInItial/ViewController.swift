//
//  ViewController.swift
//  Swift_amazingInItial
//
//  Created by 叶杨杨 on 2016/10/26.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

//令人眼前一亮的初始化方法
//http://www.swift.gg/2016/09/23/swift-configuring-a-constant-using-shorthand-argument-names/
class ViewController: UIViewController {

    /*
     在swift中，声明一个常量后，紧接着的闭包中进行初始化，而不是在viewdidlod中或其他的雷士方法中进行初始化，在swift中很常见，也是一种不错的写法！
     */
    //1，原始的方法
    let purpleView:UIView = {
    
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    //2,上面的方法弊端就是需要频繁的命名变量，改进方法
    
    let  yellowView:UIView = {
    
        $0.backgroundColor = .yellow
        return $0

    }(UIView())//确保在闭包中传入一个初始化的 UIView实例，好处是不用显示的在命名一个变量
    
    //3,有一个不错的库，可以写出可读性更好的代码，then 详见Then.swift文件
    

    ///Users/yeyangyang/Desktop/Swift3.0Demos/Swift_amazingInItial/Swift_amazingInItial/ViewController.swift:39:17: Cannot use mutating member on immutable value: function call returns immutable value
    let label = UILabel().then{
    
        $0.textAlignment = .center
        $0.textColor = .black
        $0.text = "Hello world!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

