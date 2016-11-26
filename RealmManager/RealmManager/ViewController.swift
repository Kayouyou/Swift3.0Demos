//
//  ViewController.swift
//  RealmManager
//
//  Created by 叶杨杨 on 2016/11/19.
//  Copyright © 2016年 叶杨杨. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //1,增加此类型的item
        for _ in 0...10 {
            
            let item = CustomItem()
            item.name = "叶杨杨"
            item.cost = 10000
            item.date = NSDate()
            RealmManager.addObjectToRealmWith(item: item)
        }

        //2,查询所有此类型的item
        let num = RealmManager.queryAllItems(itemName: "CustomItem")
        print(num)
    
        //3,删除所有此类型的item
        RealmManager.deleteCurrentItem(itemName: "CustomItem")
        let number1 = RealmManager.queryAllItems(itemName: "CustomItem")
        print(number1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

