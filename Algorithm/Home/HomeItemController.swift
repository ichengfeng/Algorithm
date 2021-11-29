//
//  HomeItemController.swift
//  Algorithm
//
//  Created by mac on 2021/9/7.
//

import UIKit
import JXPagingView
import MJRefresh

@objc protocol HomeItemControllerDelegate {
    func startRefresh()
    func endRefresh()
}

class HomeItemController: UIViewController {

    weak var delegate: HomeItemControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func headerRefresh() {
        delegate?.startRefresh()
    }

}

extension HomeItemController:JXPagingSmoothViewListViewDelegate {
    func listView() -> UIView {
        return view
    }

    func listScrollView() -> UIScrollView {
        return UIScrollView()
    }
}
