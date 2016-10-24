//
//  ViewController.swift
//  Swift_StackViewAnimation
//
//  Created by 叶杨杨 on 2016/10/24.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit
///利用stackView来完成一些意向不到的动画

class ViewController: UIViewController {

    @IBOutlet var emojiButtons: [UIButton]!{
    
        didSet{
            emojiButtons.forEach {//遍历所有的button，设置为隐藏！
            
                $0.isHidden = true
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func settingButtonTap(_ sender: UIButton) {
    
        UIView .animate(withDuration: 0.3) { 
            self.emojiButtons.forEach({
                $0.isHidden = !$0.isHidden
            })
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

