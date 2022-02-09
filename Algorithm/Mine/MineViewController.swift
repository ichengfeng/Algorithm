//
//  MineViewController.swift
//  Algorithm
//
//  Created by mac on 2022/2/9.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = NavBarView()
        navBar.backBtn.isHidden = false
        self.view .addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            make.height.equalTo(Screen.navBarHeight())
        }
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
