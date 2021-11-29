//
//  HomeViewController.swift
//  Algorithm
//
//  Created by mac on 2021/9/7.
//

import UIKit
import JXPagingView
import JXSegmentedView

class HomeViewController: UIViewController,JXSegmentedViewDelegate {

    lazy var paging: JXPagingSmoothView = {
        return JXPagingSmoothView(dataSource: self)
    }()
    lazy var segmentedView: JXSegmentedView = {
        return JXSegmentedView()
    }()
    lazy var headerView: HomeHeaderView = {
        return HomeHeaderView()
    }()
    let dataSource = JXSegmentedTitleDataSource()
    var titles = ["Leecode", "Algorithm"]
    var tableHeaderViewHeight: CGFloat = 300
    var headerInSectionHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        view.addSubview(paging)

        dataSource.titles = titles
        dataSource.titleSelectedColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        dataSource.titleNormalColor = UIColor.black
        dataSource.isTitleColorGradientEnabled = true
        dataSource.isTitleZoomEnabled = true

        segmentedView.backgroundColor = .white
        segmentedView.isContentScrollViewClickTransitionAnimationEnabled = false
        segmentedView.delegate = self
        segmentedView.dataSource = dataSource

        let line = JXSegmentedIndicatorLineView()
        line.indicatorColor = UIColor(red: 105/255, green: 144/255, blue: 239/255, alpha: 1)
        line.indicatorWidth = 30
        segmentedView.indicators = [line]

        segmentedView.contentScrollView = paging.listCollectionView

        paging.listCollectionView.panGestureRecognizer.require(toFail: navigationController!.interactivePopGestureRecognizer!)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        paging.frame = view.bounds
    }

    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        navigationController?.interactivePopGestureRecognizer?.isEnabled = (index == 0)
    }
}

extension HomeViewController: JXPagingSmoothViewDataSource,JXPagingSmoothViewDelegate {
    func heightForPagingHeader(in pagingView: JXPagingSmoothView) -> CGFloat {
        return tableHeaderViewHeight
    }

    func viewForPagingHeader(in pagingView: JXPagingSmoothView) -> UIView {
        return headerView
    }

    func heightForPinHeader(in pagingView: JXPagingSmoothView) -> CGFloat {
        return headerInSectionHeight
    }

    func viewForPinHeader(in pagingView: JXPagingSmoothView) -> UIView {
        return segmentedView
    }

    func numberOfLists(in pagingView: JXPagingSmoothView) -> Int {
        return dataSource.titles.count
    }

    func pagingView(_ pagingView: JXPagingSmoothView, initListAtIndex index: Int) -> JXPagingSmoothViewListViewDelegate {
        switch index {
        case 0:
            let vc = LeecodeViewController()
            vc.delegate = self
            vc.title = dataSource.titles[index]
            return vc
        default:
            let vc = AlgorithmViewController()
            vc.delegate = self
            vc.title = dataSource.titles[index]
            return vc
        }
    }
    
}

extension HomeViewController: HomeItemControllerDelegate {
    func startRefresh() {
        paging.listCollectionView.isScrollEnabled = false
        segmentedView.isUserInteractionEnabled = false
    }

    func endRefresh() {
        paging.listCollectionView.isScrollEnabled = true
        segmentedView.isUserInteractionEnabled = true
    }
}
