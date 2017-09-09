//
//  ViewController.swift
//  Swift_autolayoutTip
//
//  Created by 叶杨杨 on 2017/9/9.
//  Copyright © 2017年 叶杨杨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //注意这里的weak必须去掉，强引用它，不然在edit收回时属性会释放掉
    @IBOutlet var wrapperView: UIView!//视图容器，注意设置clipstobound = true
    @IBOutlet var edgeConstraint: NSLayoutConstraint!//底部边缘的约束
    var zeroHeightConstraint: NSLayoutConstraint!//一个存储高度为0的约束
    @IBOutlet weak var myslider: UISlider!
    
    @IBOutlet weak var sliderName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //编辑item点击事件，用于运行时变换布局
    @IBAction func editTap(_ sender: Any) {
    
        //如果没有创建，我们将为wrapperView手动的创建一个zero约束，注意“heightAnchor”是ios9以后才可以使用的！！！
        if zeroHeightConstraint == nil {
            zeroHeightConstraint = wrapperView.heightAnchor.constraint(equalToConstant: 0)
        }
        
        let shouldShow = !edgeConstraint.isActive
        
        //需要特别注意的是激活一个约束前，必选先禁用另外一个约束
        if shouldShow {
            zeroHeightConstraint.isActive = false
            edgeConstraint.isActive       = true
        }else{
            edgeConstraint.isActive       = false
            zeroHeightConstraint.isActive = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

