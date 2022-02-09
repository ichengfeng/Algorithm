//
//  MainViewController.swift
//  Algorithm
//
//  Created by mac on 2022/2/9.
//

import UIKit
import YYCategories

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        ///移除分割线
//        if #available(iOS 13.0, *) {
//            let tabbarApperance = self.tabBar.standardAppearance
//            tabbarApperance.backgroundImage = UIImage(color: UIColor(hexString: "#FFFFFF")!)
//            tabbarApperance.shadowImage = UIImage(color: UIColor(hexString: "#FFFFFF")!)
//            tabbarApperance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#747474")!]
//            tabbarApperance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(hexString: "#00c9e8")!]
//            self.tabBar.standardAppearance = tabbarApperance
//        } else {
//            let rect = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0.5)
//            UIGraphicsBeginImageContext(rect.size)
//            let context = UIGraphicsGetCurrentContext()
//            context?.fill(rect)
//            let img = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//
//            self.tabBar.backgroundImage = img;
//            self.tabBar.shadowImage = img;
//            self.tabBar.backgroundColor = UIColor(hexString: "#FFFFFF")
//        }
        
        buildTabBarItems()
        
        self.tabBar.tintColor = UIColor(hexString: "#00c9e8")
    }
    
    func buildTabBarItems() {
        
        let homeNav = NavigationController(rootViewController: HomeViewController())
        let mineNav = NavigationController(rootViewController: MineViewController())
        let navs = [homeNav,mineNav]
        self.viewControllers = navs
        
        let normalImages = ["wifi","video"]
        let selectImages = ["wifi_h","video_h"]
        let titles = ["首页","我的"]
        
        for i in 0...normalImages.count-1 {
            let item : UITabBarItem = self.tabBar.items![i]
            item.image = UIImage(named: normalImages[i])?.withRenderingMode(.alwaysOriginal)
            item.selectedImage = UIImage(named: selectImages[i])?.withRenderingMode(.alwaysOriginal)
            item.title = titles[i]
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(hexString: "#747474")!], for: .normal)
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor(hexString: "#00c9e8")!], for: .selected)
        }
        
        self.selectedIndex = 0
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
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
