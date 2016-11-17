
//
//  BundleExtension.swift
//  Swift_nameSpace
//
//  Created by 叶杨杨 on 2016/11/17.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import Foundation

extension Bundle{
    
    // 1，方法返回命名空间字符串
//    func nameSpace() -> String {
//        
//     
////        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        
//        return infoDictionary?["CFBundleName"] as? String ?? ""
//    }
    
    
    //2，计算属性，类似于函数，没有参数 和 返回值
    var nameSpace : String{
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
    
    
}
