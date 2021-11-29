//
//  WaterfallFlowLayout.swift
//  walle
//
//  Created by mac on 2021/8/25.
//

import UIKit

@objc protocol WaterfallFlowLayoutDelegate : NSObjectProtocol {

    func waterflowLayout(waterflowLayout:WaterfallFlowLayout, heightForItemAtIndex index:NSInteger, itemWidth:CGFloat) -> CGFloat
    
    /// 竖排 数
    @objc optional func columnCountInWaterflowLayout(waterflowLayout:WaterfallFlowLayout) -> Int
    
    /// 竖向 间距
    @objc optional func columnMarginInWaterflowLayout(waterflowLayout:WaterfallFlowLayout) -> CGFloat
    
    /// 横向 间距
    @objc optional func rowMarginInWaterflowLayout(waterflowLayout:WaterfallFlowLayout) -> CGFloat
    
    /// 边缘间距
    @objc optional func edgeInsetsInWaterflowLayout(waterflowLayout:WaterfallFlowLayout) -> UIEdgeInsets
    
}

class WaterfallFlowLayout: UICollectionViewLayout {

    
    weak open var delegate: WaterfallFlowLayoutDelegate?
    
    fileprivate let defaultColumnCount : Int = 2
    fileprivate let defaultColumnMargin : CGFloat = 8.0
    fileprivate let defaultRowMargin : CGFloat = 8.0
    fileprivate let defaultEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    
    var attrsArray : Array<UICollectionViewLayoutAttributes> = []
    var contentHeight : CGFloat = 0
    var columnHeights : Array<CGFloat> = []
    
    override func prepare() {
        
        super.prepare()
        
        if collectionView == nil {
            return
        }
        
        // 清除以前计算的所有高度
        columnHeights.removeAll()
        var i = 0
        while i < self.columnCount() {
            self.columnHeights.append(self.edgeInsets().top)
            i += 1
        }
        
        // 清除之前所有的布局属性
        attrsArray.removeAll()
        // 开始创建每一个cell对应的布局属性
        let count = collectionView?.numberOfItems(inSection: 0) ?? 0
        var j = 0
        while j < count {
            // 获取indexPath位置cell对应的布局属性
            let attrs : UICollectionViewLayoutAttributes = self.layoutAttributesForItem(at: NSIndexPath(item: j, section: 0) as IndexPath) ?? UICollectionViewLayoutAttributes()
            
            attrsArray.append(attrs)
            j += 1
        }
        
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

        let attrs : UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)

        let collectionViewW = collectionView?.frame.size.width ?? 0

        let w = CGFloat((collectionViewW - self.edgeInsets().left - self.edgeInsets().right - CGFloat((self.columnCount()-1))*self.columnMargin())) / CGFloat(self.columnCount())
        let h = self.delegate?.waterflowLayout(waterflowLayout: self, heightForItemAtIndex: indexPath.item, itemWidth: w) ?? 0
        var destColumn = 0
        var minColumnHeight = self.columnHeights[0]

        var k = 0
        while k < self.columnCount() {
            let columnHeight = self.columnHeights[k]
            if minColumnHeight > columnHeight {
                minColumnHeight = columnHeight
                destColumn = k
            }
            k += 1
        }

        let x = self.edgeInsets().left + CGFloat(destColumn)*(w + self.columnMargin())
        var y = minColumnHeight

        if y != self.edgeInsets().top {
            y += self.rowMargin()
        }
        attrs.frame = CGRect.init(x: x, y: y, width: w, height: h)

        self.columnHeights[destColumn] = attrs.frame.maxY

        let columnHeight = self.columnHeights[destColumn]

        if self.contentHeight < columnHeight {
            self.contentHeight = columnHeight
        }

        return attrs
    }
    
}

extension WaterfallFlowLayout {
    func rowMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.rowMarginInWaterflowLayout(waterflowLayout:))))!{
            return (self.delegate?.rowMarginInWaterflowLayout!(waterflowLayout: self))!
        }else{
            return defaultRowMargin
        }
    }
    
    func columnMargin() -> CGFloat {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.columnMarginInWaterflowLayout(waterflowLayout:))))!{
            return (self.delegate?.columnMarginInWaterflowLayout!(waterflowLayout: self))!
        }else{
            return defaultColumnMargin
        }
    }
    
    func columnCount() -> Int {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.columnCountInWaterflowLayout(waterflowLayout:))))!{
            return (self.delegate?.columnCountInWaterflowLayout!(waterflowLayout: self))!
        }else{
            return defaultColumnCount
        }
    }
    
    func edgeInsets() -> UIEdgeInsets {
        if self.delegate != nil && (self.delegate?.responds(to: #selector(self.delegate?.edgeInsetsInWaterflowLayout(waterflowLayout:))))!{
            return (self.delegate?.edgeInsetsInWaterflowLayout!(waterflowLayout: self))!
        }else{
            return defaultEdgeInsets
        }
    }
}

extension WaterfallFlowLayout {
    
    // 决定cell的排布
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attrsArray
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize.init(width: 0, height: self.contentHeight + self.edgeInsets().bottom)
    }
    
}
