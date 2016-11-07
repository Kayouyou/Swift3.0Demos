
//
//  UIButton_extension.swift
//  Swift(guard)
//
//  Created by 叶杨杨 on 2016/11/7.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit

extension UIButton{
    
    //默认值为红色
    convenience init(title:String,color:UIColor = .red){
        
        self.init()
        
        self.setTitle(title, for: UIControlState(rawValue:0))
        self.setTitleColor(color, for: UIControlState(rawValue: 0))
        self.sizeToFit()
        
    }
    
    
    
}
