//
//  WBHomeViewController.swift
//  Swift_微博
//
//  Created by 叶杨杨 on 2016/11/19.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //导航栏按钮 事件监听 显示好友
    
    @objc fileprivate func showFriends(){
        //打印方法名
        print(#function)
        //push 时容易忽略底部bar的隐藏，所以最好重写push方法，在navi中重写
        
    }
}

// MARK - 扩展中重写父类方法

extension WBHomeViewController {
    
    override func setUpUI() {
        
        super.setUpUI()
        
        //设置导航栏按钮
        //系统的无法高亮
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", style: .plain, target: self, action: #selector(showFriends))
        
        //2,自定义设置高亮
        // 如果使用的OC的分类创建的button，如果返回的是instancetype，则判断不出是UIButton，所以需要在btn: UIButton指明类型，不然会报解包的错误！！！
//        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
//        btn.setTitle("好友", for: .normal)
//        btn.setTitleColor(UIColor.darkGray, for: .normal)
//        btn.setTitleColor(UIColor.orange, for: .highlighted)
//        btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        //3,利用extension 创建item,简化代码
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", target: self, action: #selector(showFriends))

    }
    
    
}

