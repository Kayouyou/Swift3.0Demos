//
//  WBNavigationController.swift
//  Swift_微博
//
//  Created by 叶杨杨 on 2016/11/19.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// 自定义导航栏
class WBNavigationController: UINavigationController {

    //为了解决默认的导航条，自定导航条，达到我们想要的效果
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //1,隐藏默认的导航条
        navigationBar.isHidden = true
        
        //2,自定义一个bar，在基类中
    }
    
    
    //重写 push 方法
    //viewController 被push的控制器，设置左侧的按钮，就能够作为返回按钮
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //如果不是栈底控制器才需要隐藏，跟控制器不需要处理
        //之所以判断是因为，所有的push动作都会走push方法，所以需要判断
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        //判断控制器的类型
        if let vc = viewController as? WBBaseViewController  {
            
            var title = "返回"
            
            //判断控制器的级数,只有一个子控制器的时候，显示栈底控制器的标题
            if childViewControllers.count == 1 {
                
                title = childViewControllers.first?.title ?? "返回"
            }
            
            //取出自定义的navItem
            vc.naviItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(back))
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    //pop返回到上一级控制器
    @objc fileprivate func back(){
        
        popViewController(animated: true)
    }
    
   
}
