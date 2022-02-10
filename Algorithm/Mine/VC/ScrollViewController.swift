//
//  ScrollViewController.swift
//  Algorithm
//
//  Created by mac on 2022/2/10.
//

import UIKit
import SDWebImage

class ScrollViewController: BaseViewController {

    let scrollView_1 : UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.title = "ScrollView"
        
        config_1_scroll()
    }

    func config_1_scroll() {
        scrollView_1.contentSize = CGSize(width: kScreenWidth*8, height: 180.ar)
        self.view.addSubview(scrollView_1)
        scrollView_1.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.left.right.equalTo(self.view)
            make.height.equalTo(180.ar)
        }
        
        for i in 0..<8 {
            let img = UIImageView()
            img.tag = 1000+i
            img.sd_setImage(with: URL(string: "https://picsum.photos/180/375?random=\(i+1)"), completed: nil)
            scrollView_1.addSubview(img)
            img.snp.makeConstraints { make in
                make.left.equalTo(CGFloat(i) * kScreenWidth);
                make.width.equalTo(kScreenWidth)
                make.top.height.equalTo(scrollView_1)
            }
        }
    }
    
}
