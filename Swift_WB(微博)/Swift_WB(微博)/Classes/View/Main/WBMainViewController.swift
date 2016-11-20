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

    // MARK - 私有控件
    lazy var composeButton : UIButton = UIButton()

    //Swift 3.0跟之前API变化了
    private var _orientations = UIInterfaceOrientationMask.portrait
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpChildControllers()
        setUpComposeButton()
    }
    
   
    /**
     1,使用代码控制设备方向，好处是可以在需要的时候单独处理
     2,设置支持方向之后，当前的控制器及子控制器都会遵守这个方向
     3,如果播放器，通常是通过modal 展现的
 
    */
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self._orientations }
        set { self._orientations = newValue }
    }
    
    // MARK - 监听方法
    //不加objc的话，会报错，private能保证方法私有，保证当前对象可以访问
    //@objc允许这个函数在运行时通过OC的消息机制被调用
    /**
     Swift3 中新增了几个关键字 fileprivate open
     fileprivate: 来显示的表明这个元素的访问权限为文件内私有
     private: 真正的私有，离开这个类或者结构体的作用域就无法访问
     open: 标记一个元素可以在其他地方可以被override或继承
     public: 标记一个元素可以在其他地方被访问
 
    */
    @objc fileprivate func composeStatus(){
        
        print("plus被点击");
        
    }
    

}


// 类似OC的分类，用来拆分代码块，可以把相近的功能函数放在一个extension中，这样便于代码维护
// 使用注意： OC 不能定义属性，这个也不能定义属性，只能定义方法

// MARK - 设置界面
extension WBMainViewController{
    
    
    fileprivate func  setUpComposeButton() -> () {
        
        tabBar.addSubview(composeButton)
        composeButton.backgroundColor = UIColor.red
        
        //设置composeButton的位置
        let count  = CGFloat(childViewControllers.count)
        // button之间有一个像素的容错点，将向内缩进的宽度减少，能够让按钮宽度变大，盖住容错点，防止穿帮
        let w = tabBar.bounds.width / count - 1
        
        //类似OC的CGRectInset 正数向内缩进，负数向外扩展
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        
        //按钮监听方法
        composeButton.addTarget(self, action:#selector(composeStatus), for: .touchUpInside)
        
    }

    ///设置所有子视图
     fileprivate func setUpChildControllers() {
        
        let array = [
        ["clsName":"WBHomeViewController","title":"首页","imageName":"homeImage"],["clsName":"WBMessageViewController","title":"消息","imageName":"homeImage"],["clsName":"UIViewController","title":"plus","imageName":"homeImage"],["clsName":"WBDiscoverViewController","title":"发现","imageName":"homeImage"],["clsName":"WBProfileViewController","title":"我","imageName":"homeImage"]
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
    fileprivate func controller(dict : [String: String]) -> UIViewController{
      
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
        vc.tabBarItem.image = UIImage(named: "")
        vc.tabBarItem.selectedImage = UIImage(named:"")?.withRenderingMode(.alwaysOriginal)
        
        //4,设置tabbar标题 字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        //系统默认12号字体 normal字体大小
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 24)], for: .normal)
        //细节： 实例化导航控制器时会也调用push一次
        let nav = WBNavigationController(rootViewController: vc)
        return nav//多态
    }

}
