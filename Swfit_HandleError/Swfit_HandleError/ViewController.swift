//
//  ViewController.swift
//  Swfit_HandleError
//
//  Created by 叶杨 on 2016/11/28.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit

//处理错误
/**
 Swift中提供了4中处理错误的方法，当一个函数抛出一个错误的时候，最重要的是能迅速的识别代码中会抛出错误的地方，为了标示，在调用一个能抛出错误的函数，方法，构造器之前加上try关键字！
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
       let vendingMenchine = VendingMenchine()
//       try! vendingMenchine.vend(itemNamed: "Chips")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: throwing 传递错误
//只用throwing函数可以传递错误,在->之前添加throws关键字

enum VendingMachineError:Error {
    case invalidSelection   //选择无效
    case insufficientFunds(coinsNeeded:Int)  //金额不足
    case outOfStock         //缺货
}

struct Item {
    var price : Int
    var count : Int
}

class VendingMenchine {
    
    var inventory = [
    "Candy Bar": Item(price: 12, count: 7),
    "Chips" :Item(price: 10, count: 4)
    ]
    
    var coinsDeposited = 0
    func dispenseSnack(snack:String)  {
        
        print("Dispensing\(snack)")
    }
    
    func vend(itemNamed name:String)throws {
        guard let item = inventory[name] else {
            //throw会立即退出方法
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            
            throw VendingMachineError.insufficientFunds(coinsNeeded:item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing\(name)")
    
    }
}

//由于vend方法会传递出它抛出的任何错误，在你的代码中，必须要么直接处理这些错误，使用  do catch try! try? 要么继续传递这些错误传递下去

let favouriteSnacks = ["Alice" : "Chips" ,"Bob" : "licorice"]

func buyFavouriteSnack(person:String,VendingMenchine:VendingMenchine)
throws{
    
    let snackName = favouriteSnacks[person] ?? "Candy Bar"
    //因为在调用vend的时候可能抛出错误，所以在其前面加上try
    try VendingMenchine.vend(itemNamed: snackName)
}

//throwing构造器和throwing函数一样，在构造过程中调用throwing函数，并且通过传递到他的调用者来处理这些错误
struct PurchaseSnack{
    
    let name:String
    init(name:String,VendingMenchine:VendingMenchine)throws{
        
        try VendingMenchine.vend(itemNamed: name)
        self.name = name
    }
}





