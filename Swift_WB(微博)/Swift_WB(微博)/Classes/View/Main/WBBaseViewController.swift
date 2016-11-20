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

    //表格视图，如果用户没有登录就不创建
    var tabelView: UITableView?
    
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
        
        //1，创建导航条
        setUpNavigationBar()
        
        //2,创建tableview
        setUpTableView()
        
        
    }
    
    //设置表格视图
    private func setUpTableView() -> () {
      
        tabelView = UITableView(frame: view.bounds, style: .plain)
        //直接添加会发现导航条不见了
        //view.addSubview(tabelView!)
        //添加到bar下面
        view.insertSubview(tabelView!, belowSubview: navigationBar)
    }
    
    //设置导航条
    private func setUpNavigationBar() -> () {
      
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
