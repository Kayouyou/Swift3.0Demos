//
//  WBBaseViewController.swift
//  Swift_微博
//
//  Created by 叶杨杨 on 2016/11/19.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// 基类
class WBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
}

// MARK - 设置界面
extension WBBaseViewController {
    
    func setUpUI(){
        
        view.backgroundColor = UIColor.white
        
    }
    
    
    
    
}
