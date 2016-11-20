//
//  WBMainViewController.swift
//  Swift_微博
//
//  Created by 叶杨杨 on 2016/11/19.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// 主控制器
class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpChildControllers()
    
    }

}



// 类似OC的分类，用来拆分代码块，可以把相近的功能函数放在一个extension中，这样便于代码维护
// 使用注意： OC 不能定义属性，这个也不能定义属性，只能定义方法

// MARK - 设置界面
extension WBMainViewController{
    
    ///设置所有子视图
    func setUpChildControllers() {
        
        let array = [
        ["clsName":"WBHomeViewController","title":"首页","imageName":"homeImage"],["clsName":"WBMessageViewController","title":"消息","imageName":"homeImage"],["clsName":"WBDiscoverViewController","title":"发现","imageName":"homeImage"],["clsName":"WBProfileViewController","title":"我","imageName":"homeImage"]
        ]
        
        var arrayM = [UIViewController]()
        
        for dict in array{
            
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    /// 使用字典创建一个子控制器
    ///
    /// - Parameter dict: 信息字典
    /// - Returns: 子控制器
    private func controller(dict : [String: String]) -> UIViewController{
      
        //1,取得字段内容,守护内容
        guard let clsName = dict["clsName"],
               let title = dict["title"],
               let imageName = dict["imageName"],
               let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName) as? UIViewController.Type else{
                
                
                return UIViewController()
        }
        
        //2,创建视图控制器
        let vc = cls.init()
        vc.title = title
        
        //3,设置图像
//        vc.tabBarItem.image = UIImage(named: "")
//        vc.tabBarItem.selectedImage = UIImage(named:"")?.withRenderingMode(.alwaysOriginal)
        
        //4,设置tabbar标题 字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        
        //系统默认12号字体 normal字体大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 24)], for: .normal)
        
        let nav = WBNavigationController(rootViewController: vc)
        return nav//多态
    }

}
