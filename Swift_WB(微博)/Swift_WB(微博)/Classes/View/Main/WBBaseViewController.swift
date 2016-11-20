//
//  WBBaseViewController.swift
//  Swift_微博
//
//  Created by 叶杨杨 on 2016/11/19.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit


/// 基类,OC不支持多继承，如果不支持如何替代，使用协议替代！
/// swift的写法更类似与多继承
/// swift中利用extension可以吧函数按照功能分类管理，便于阅读和维护
/**
 1，extension中不能有属性
 2，extension中不能重写父类方法，重写父类方法是子类的职责
 */
class WBBaseViewController: UIViewController{

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
        
        //设置数据源和代理
        tabelView?.delegate = self
        tabelView?.dataSource = self
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

// MARK - tableView 的代理和数据源方法
extension WBBaseViewController :UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    //基类只是准备方法，子类负责具体实现
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //只是保证没有语法错误
        return UITableViewCell()
    }
    
    
}



