//
//  UITextFiled_extension.swift
//  Swift(guard)
//
//  Created by 叶杨杨 on 2016/11/7.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit
// MARK: - 分类 extension 类似OC 的category
// MARK: - 抽取控件的创建方法

extension UITextField {
    
    //函数可以有默认值
    convenience init(frame : CGRect,placeHolder:String,fontSize: CGFloat = 14){
        //实例化
        self.init(frame:frame)
        
        self.borderStyle = .roundedRect
        self.font = UIFont.systemFont(ofSize: fontSize)
        self.placeholder = placeHolder
        
    }
}
