//
//  L_001_两数之和.swift
//  Algorithm
//
//  Created by mac on 2021/11/16.
//

import UIKit

class L_001_____: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var temps: [Int] = []
            for (vIndex ,value) in nums.enumerated() {
                let t = target - value
                for (nIndex ,number) in nums.enumerated() {
                    if number == t && nIndex != vIndex {
                        temps = [vIndex,nIndex]
                    }
                }
            }
        return temps
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
