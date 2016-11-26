//
//  ViewControllerB.swift
//  Swift_Initializer
//
//  Created by 叶杨 on 2016/11/26.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit


/// 类的继承和构造过程
/**
 类的所有的存储属性-包括所有的继承自父类的属性-都必须在构造过程中设置初始值
 Swift中提供了两中构造器来确保实例中的所有的存储属性都能获得初始值，他们分别是制定构造器和便利构造器
 */
class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
