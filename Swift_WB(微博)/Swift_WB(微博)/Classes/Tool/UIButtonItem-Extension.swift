//
//  UIButtonItem-Extension.swift
//  Swift_WB
//
//  Created by 叶杨杨 on 2016/11/20.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    
    //创建 uibarbuttonitem
    //便利构造函数
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject? ,action: Selector) {
       
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        btn.addTarget(target, action: action, for: .touchUpInside)

        // self.init 便利构造器需要使用self初始化
        self.init(customView:btn)
    }
}
