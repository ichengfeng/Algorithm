//
//  NavBarView.swift
//  Algorithm
//
//  Created by mac on 2022/2/9.
//

import UIKit
import YYCategories
import SnapKit

class NavBarView: UIView {
    
    let backgroundImg : UIImageView = {
        let img = UIImageView()
        img.isUserInteractionEnabled = true
        img.image = UIImage(named: "nav")
        return img
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.ar, weight: .medium)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    let backBtn : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.setTitleColor(UIColor(hexString:"#939AB2"), for: .normal)
        return btn
    }()
    
    var noBackAction : Bool = false {
        didSet{
            if noBackAction == true {
                self.backBtn.removeTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
            }else {
                self.backBtn .addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
            }
        }
    }
    
    var title : String? {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    var leftTitle : String? {
        didSet {
            self.backBtn.setImage(UIImage(), for: .normal)
            self.backBtn.setTitle(leftTitle, for: .normal)
            self.backBtn.isEnabled = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        backgroundImg.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(backgroundImg)
            make.top.equalTo(Screen.statusBarHeight()+6.ar)
            make.height.equalTo(21.ar)
        }
        
        backgroundImg.addSubview(backBtn)
        backBtn.snp.makeConstraints { make in
            make.left.equalTo(16.ar)
            make.top.equalTo(Screen.statusBarHeight()+6.ar)
            make.height.equalTo(32.ar)
        }
        backBtn.addTarget(self, action: #selector(backBtnAction), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backBtnAction() {
        if self.noBackAction {
            return;
        }
        UIViewController().topMost.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
