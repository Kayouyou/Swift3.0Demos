//
//  ViewController.swift
//  Swift_重写setter方法设置模型数据
//
//  Created by 叶杨杨 on 2016/11/15.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let p = Person()
        
        p.name = "小明";
    
        let label = DemoLabel(frame: CGRect(x: 10, y: 20, width: 100, height: 40))
        
        view.addSubview(label)
    
        //将模型设置给label
        label.person = p
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

