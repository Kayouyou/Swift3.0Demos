//
//  Then.swift
//  Swift_amazingInItial
//
//  Created by 叶杨杨 on 2016/10/26.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import Foundation

//一个可以帮助写出可读性更好的代码

public protocol Then {}

//默认一般的参数是在函数内部可以改变的，当这个函数长记性完之后呢就会销毁，不会有机会改变函数以外的变量，如果想改变就需要inout关键字
extension Then where Self:Any {

    
    public func then( block: (inout Self) -> Void) -> Self {
        
        var copy = self
        block(&copy)//当我们传入的时候在变量名字前用&符号修饰，传递给inout参数，表明这个变量在参数内部是可以改变的
        return copy
    }
}

extension Then where Self: AnyObject {
    
    public mutating func then(block :(inout Self) -> Void) -> Self{
        
        block(&self)
        
        return self
    }
}

extension NSObject: Then{}

