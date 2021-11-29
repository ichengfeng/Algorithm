//
//  Stack.swift
//  Algorithm
//
//  Created by mac on 2021/11/16.
//

import Foundation

struct Stack {
    var items = [Any]()
    mutating func push(_ item: Any) {
        items.append(item)
    }
    mutating func pop() {
        items.removeLast()
    }
}

extension Stack {
    var topItem: Any? {
        return items.isEmpty ? nil : items[items.count-1]
    }
}
