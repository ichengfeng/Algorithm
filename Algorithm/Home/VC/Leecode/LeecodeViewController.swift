//
//  LeecodeViewController.swift
//  Algorithm
//
//  Created by mac on 2021/9/7.
//

import UIKit
import MJRefresh

class LeecodeViewController: HomeItemController {
    
    lazy var collection: UICollectionView = {
        let layout = WaterfallMutiSectionFlowLayout()
        layout.delegate = self
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(LeecodeCell.self, forCellWithReuseIdentifier: LeecodeCell.identifiers)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view .addSubview(collection)
        collection.reloadData()
    }

    
    override func headerRefresh() {
        delegate?.startRefresh()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
            self.collection.mj_header?.endRefreshing()
            self.delegate?.endRefresh()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collection.frame = view.bounds
    }
    
}

extension LeecodeViewController {
    override func listView() -> UIView {
        return view
    }
    
    override func listScrollView() -> UIScrollView {
        return collection
    }
}


extension LeecodeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(9*(arc4random()%4+1))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeecodeCell.identifiers, for: indexPath) as! LeecodeCell
        cell.testLab.text = "section \(indexPath.section) item \(indexPath.row)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
//            let a  = L_001_____()
//            print(a.twoSum([2,3,4], 7))
        }
    }
}

extension LeecodeViewController: WaterfallMutiSectionDelegate {
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return 80
    }
    
    func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
        return 3
    }
    
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 5
    }
    
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 5
    }
}

class LeecodeCell: UICollectionViewCell {
    static let identifiers = "LeecodeCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBaseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configBaseView() {
        backgroundColor = .darkGray
        addSubview(testLab)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        testLab.frame = self.bounds
    }
    
    lazy var testLab: UILabel = {
        let tmp = UILabel()
        tmp.textColor = .white
        tmp.font = .systemFont(ofSize: 14)
        tmp.textAlignment = .center
        tmp.numberOfLines = 0
        return tmp
    }()
}
