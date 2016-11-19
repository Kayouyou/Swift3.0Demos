//
//  RealmManager.swift
//  RealmManager_Swift
//
//  Created by 666GPS on 2016/11/18.
//  Copyright © 2016年 yeyangyang. All rights reserved.
//

import UIKit
import RealmSwift

class RealmManager: NSObject {

    /// 1，add新的对象到数据库
    ///
    /// - Parameter model: 新的对象
    class func addObjectToRealmWith(item : Object) -> (){
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(item)
        }
    }
    
    /// 2,delete对应clsName的所有对象
    ///
    /// - Parameter model: 移除的对象的clsName
    class func deleteCurrentItem(itemName : String) -> (){
        
        let realm = try! Realm()
        try! realm.write{
           
            let clsName = Bundle.main.nameSpace + "." + itemName
            let items = realm.objects((NSClassFromString(clsName) as? Object.Type)!)
            for item in items {
                realm.delete(item)
            }
        }
    }
    
    /// 3,delete单一对象
    ///
    /// - Parameter item: 单一对象item
    class func deleteSingleItem(item : Object) -> () {
        
        let realm = try! Realm()
        try! realm.write{
            
            realm.delete(item)
        }
    }
    
    /// 4, change对象item的值
    ///
    /// - Parameter closure: 改变操作的闭包
    class func changeValueWithChangeCondition(closure :() ->()) -> () {
        
        let realm = try! Realm()
        try! realm.write{
            closure()
        }
    }
    
    /// 5, 依据条件查询对应的item
    ///
    /// - Parameter condition: 查询条件
    class func queryItemsWithCondition(condition : String,itemName : String) -> Results<Object> {
        
        let realm = try! Realm()
        let predicate = NSPredicate(format: condition)
        let clsName = Bundle.main.nameSpace + "." + itemName
        let items = realm.objects((NSClassFromString(clsName) as? Object.Type)!).filter(predicate)
        return items
    }
    
    
    /// 6,query当前item的所有对象
    ///
    /// - Parameter itemName: item名称
    /// - Returns: 返回查询结果
    class func queryAllItems(itemName : String) -> Results<Object> {
        
        let realm = try! Realm()
        let clsName = Bundle.main.nameSpace + "." + itemName
        let items = realm.objects((NSClassFromString(clsName) as? Object.Type)!)
        return items
    }
    
    /// 7,Clear Realm数据库中的所有的对象
    class func deleteAllItems() -> () {
    
        let realm = try! Realm()
        try! realm.write{
            
            realm.deleteAll()
        }
    }
}
