//
//  ViewController.swift
//  Swift_泛型实例
//
//  Created by 叶杨 on 2016/11/29.
//  Copyright © 2016年 叶杨. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //定义一些实例，结构体默认会创建一个遍历构造器
        let paris = City(name: "Paris", population: 2241)
        let madrid = City(name: "Madrid", population: 3165)
        let amsterdan = City(name: "Amsterdan", population: 827)
        let berlin = City(name: "Berlin", population: 3562)
        let cities = [paris,madrid,amsterdan,berlin]

        //现在我们可以使用map filter reduce 来筛选出至少一百万的城市
        //filter筛选结果是一个数组，对其调用map：然后返回值调用reduce即可得到最终的结果
        let result =
            cities.filter {($0.population > 1000)}
            .map { ($0.cityByScallingPopulation())}
            .reduce("City:Population"){//首行是 city : population
                result, c in return result + "\n" + "\(c.name):\(c.population)"
        }
        
        print(result)
        
    }

}

struct City  {
    
    let name:String
    let population:Int
}

//我们想筛选出一个至少一百万的城市，并打印出城市名字和人口数，定义一个辅助函数换算城市人口数
extension City{
    
    func cityByScallingPopulation() -> City {
        
        return City(name: name, population: population * 1000)
    }
}


