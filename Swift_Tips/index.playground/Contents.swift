//: Playground - noun: a place where people can play

import UIKit

/**
 下标,swift中数组和字典都可以通过下标获取值，不同的是字典得到的是可选值类型，因为你无法确保所有的key都是有效的，数组则会直接崩溃！
 */

// 数组下标有两种方法 （index:Int） (subRange:Range<Int>)

// 如果我们想直接获取特定下标的数组元素呢？ swift标准体系中时做不到的
// 我们可以扩展数组加一个接收下标数组，读取元素的方法
extension Array{
    
    subscript(input:[Int]) -> ArraySlice<Element>{
        
        get{
            var result = ArraySlice<Element>()
            for i in input{
                
                assert(i < self.count,"index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set{
            for (index,i) in input.enumerated(){
                
                assert(i < self.count,"index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

//这样我们就可以大大增加了array的灵活性！
var arr = [1,2,3,4,5]
arr[[0,3,4]]
var arraySlice =  arr[0...1]  // 注意通过range范围获取的是数组切片不是数组
print(type(of:arraySlice))
print(type(of: Array(arraySlice)))//可以Array() 转换为数组






