//
//  A_002_Bubble.swift
//  Algorithm
//
//  Created by mac on 2021/11/16.
//

import UIKit
struct A_002_Bubble {
    func bubble(list datas:Array<Int>) {
        var i = 0,j = 0
        var dataArr = datas
        while i < 7 {
            j = i+1
            while j < dataArr.count {

                if dataArr[i] > dataArr[j] {
                    dataArr.swapAt(i, j)
                }
                j+=1
            }
            i+=1
        }
        print(dataArr)
    }
}
