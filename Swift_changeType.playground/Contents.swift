//: Playground - noun: a place where people can play

import UIKit

/**
 Swift中了类型转换使用is，as操作符实现，
 */

class MediaItem{
    
    var name : String
    
    init(name: String) {
        self.name = name
    }
}

class Movie:MediaItem{
    
    var director : String
    init(name: String,director:String) {
        
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem{
    
    var artist: String
    init(name:String,artist:String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [

    Movie(name: "mike", director: "jake"),
    Song(name: "dream", artist: "dream"),
    Movie(name: "mike", director: "jake"),
    Song(name: "dream", artist: "dream")
]

//检查类型
var movieCount = 0
var songCount  = 0

for item in library{
    
    if item is Movie {
        
        movieCount += 1
        
    }else if item is Song {
        
        songCount += 1
    }
}


//向下转型，；类型转换操作符 as? as!

for item in library{
    
    if let movie = item as? Movie {
        
        print("Movie: \(movie.name)")
    }else if let song = item as? Song{
        print("Song:\(song.name)")
    }
    
}

//Any AnyObject
/**
 Swift 提供两种特殊的类型别名
 
 Any: 表示任何类型，包括函数类型
 AnyObject:表示任何类类型的实例
 只有当你确定需要他们的行为和功能的时候才会使用，因为明确类型总是好的！
 */
var things = [Any]()
let opitionalNumber:Int? = 3
//things.append(opitionalNumber)//警告
/**
 Any类型可以表示所有类型的值，包括可选类型，Swift会在你用Any类型来表示一个可选值的时候给你一个警告，如果你确实想使用Any；类型来承载可选值，你可以使用as操作符显示转换为Any
 */
things.append(opitionalNumber as Any)//没有警告








