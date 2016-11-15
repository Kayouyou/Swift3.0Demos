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
    
    //1.懒加载基本写法
    
    /**
     1,能够延迟加载
     2，最大的好处就是可以解除解包的烦恼，后面不用？ ！不用担心他没有值
    */
    
//    lazy var label:DemoLable = DemoLable()

    
    
    //2,懒加载其实是闭包
    //完整写法
    /**
    {} 包装代码
    () 执行代码
     日常开发不建议这样写，闭包中只能提示不好，self.还注意循环引用
    */
    lazy var label = { ()->DemoLable in
        let l = DemoLable()
        
        //设置lable属性
        
        return l
    }()
    
    
    //声明一个私有的懒加载属性label
    private lazy var MyLabel:UILabel? = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(MyLabel)
        
        MyLabel?.text = "hello"
        MyLabel?.sizeToFit()
        
        
        print(MyLabel)
        
        //label释放
        MyLabel = nil
        
        //注意：和OC不同
        /**
        一旦label被设置为nil，懒加载也不会再次执行！
        懒加载代码只会在第一次调用时执行闭包，然后将闭包的结果保存在label的属性中
         
         Swift中，一定注意不要主动清理视图或控件，因为懒加载不会再次创建
        */
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

