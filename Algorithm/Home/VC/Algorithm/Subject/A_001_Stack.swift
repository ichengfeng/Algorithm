//
//  A_001_Stack.swift
//  Algorithm
//
//  Created by mac on 2021/11/16.
//
///出入栈操作
import UIKit

class A_001_Stack: NSObject {

    override init() {
        
        var stack = Stack()
        
        ///apple
        stack.push("e")
        stack.push("l")
        stack.push("p")
        stack.push("p")
        stack.push("a")
        
        var str = ""
        for _ in 0...stack.items.count-1 {
            if let topItem = stack.topItem {
                str += topItem as! String
                stack.pop()
            }
        }
        print("\(str)")
        
    }
    
}
