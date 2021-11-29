//
//  PagingViewTableHeaderView.swift
//  JXPagingView
//
//  Created by jiaxin on 2018/5/28.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    lazy var imageView: UIImageView = UIImageView(image: UIImage(named: "IMG_MIMI_2.jpg"))
    var imageViewFrame: CGRect = CGRect.zero

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        imageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageViewFrame = bounds
    }

    func scrollViewDidScroll(contentOffsetY: CGFloat) {
        var frame = imageViewFrame
        frame.size.height -= contentOffsetY
        frame.origin.y = contentOffsetY
        imageView.frame = frame
    }
}
