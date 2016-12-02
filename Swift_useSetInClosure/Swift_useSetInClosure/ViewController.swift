//
//  ViewController.swift
//  Swift_useSetInClosure
//
//  Created by 叶杨杨 on 2016/12/2.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//


/// 在闭包中使用集合

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//扩展序列协议,实现筛选出唯一的元素，而又保证顺序
//“[1,2,3,12,1,3,4,5,6,4,6].unique() // [1, 2, 3, 12, 4, 5, 6]
extension Sequence where Iterator.Element:Hashable{
    
    func unique() -> [Iterator.Element] {
        var seen:Set<Iterator.Element> = []
        return filter{
            if seen.contains($0){
                return false
            }else{
                seen.insert($0)
                return true
            }
        }
    }
}
