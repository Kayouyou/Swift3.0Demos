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

    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    //自定义导航项
    lazy var naviItem = UINavigationItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    //重写title的didSet 方法
    override var title: String?{
        didSet{
            naviItem.title = title
        }
    }
}

// MARK - 设置界面
extension WBBaseViewController {
    
    func setUpUI(){
        
        view.backgroundColor = UIColor.white
        //添加自定义导航条
        view.addSubview(navigationBar)
        //将ite设置给bar
        navigationBar.items = [naviItem]
        //设置bar的渲染颜色
        //navigationBar.barTintColor =
        //设置navBar的字体颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    
    }
    
    
    
    
}
