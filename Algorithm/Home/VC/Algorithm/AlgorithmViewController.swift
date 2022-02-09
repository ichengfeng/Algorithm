//
//  AlgorithmViewController.swift
//  Algorithm
//
//  Created by mac on 2021/9/7.
//

import UIKit
import MJRefresh

class AlgorithmViewController: HomeItemController {

    lazy var collection: UICollectionView = {
        let layout = WaterfallMutiSectionFlowLayout()
        layout.delegate = self
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(AlgorithmCell.self, forCellWithReuseIdentifier: AlgorithmCell.identifiers)
        collection.register(AlgorithmHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlgorithmHeaderView.header)
        collection.register(AlgorithmHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AlgorithmHeaderView.footer)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view .addSubview(collection)
        collection.reloadData()
    }

    private func sectionName(section: Int) -> String {
      switch section {
      case 0:
        return "瀑布流布局"
      case 1:
        return "线性列表布局"
      case 2:
        return "九宫格布局"
      default:
        return ""
      }
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

extension AlgorithmViewController {
    
    override func listView() -> UIView {
        return view
    }

    override func listScrollView() -> UIScrollView {
        return collection
    }
}

extension AlgorithmViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
        // 瀑布流
    case 0:
      return 10
        // 线性
    case 1:
      return 8
        // 九宫格
    default:
      return 9
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlgorithmCell.identifiers, for: indexPath) as! AlgorithmCell
    cell.testLab.text = "section \(indexPath.section) item \(indexPath.row)"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AlgorithmHeaderView.header, for: indexPath) as! AlgorithmHeaderView
      header.testLab.text = "\(sectionName(section: indexPath.section)) header view"
      header.backgroundColor = .purple
      return header
    } else if kind == UICollectionView.elementKindSectionFooter {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AlgorithmHeaderView.footer, for: indexPath) as! AlgorithmHeaderView
      footer.testLab.text = "\(sectionName(section: indexPath.section)) footer view"
      footer.backgroundColor = .systemBlue
      return footer
    }
    return UICollectionReusableView()
  }
  
}

extension AlgorithmViewController: WaterfallMutiSectionDelegate {
  func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
    switch indexPath.section {
    case 0:
      return CGFloat((arc4random() % 3 + 1) * 30)
    case 1:
      return 135
    default:
      return 80
    }
  }
  
  func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
    switch section {
    case 0:
      return 2
    case 1:
      return 1
    default:
      return 3
    }
  }
  
  func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 40)
  }
  
  func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
    return CGSize(width: self.view.frame.size.width, height: 30)
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
  
  func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
    return 15
  }
}

class AlgorithmCell: UICollectionViewCell {
  static let identifiers = "AlgorithmCells"
  
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

class AlgorithmHeaderView: UICollectionReusableView {
  static let header = "AlgorithmHeaderViewId"
  static let footer = "AlgorithmFooterViewId"
  override init(frame: CGRect) {
    super.init(frame: frame)
    configBaseView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configBaseView() {
    addSubview(testLab)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    testLab.frame = bounds
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
