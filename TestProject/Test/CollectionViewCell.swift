//
//  CollectionViewCell.swift
//  Test
//
//  Created by popcool on 2017/7/21.
//  Copyright © 2017年 Arwin Tsai. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var titleLabel:UILabel!
    var textLabel:UILabel!
    var subView:UIView!
    var width = (Double(UIScreen.main.bounds.size.width) - 80)/2
    var height = (Double(UIScreen.main.bounds.size.height) - 160 - 40)/5
    var section:Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        subView = UIView(frame: CGRect(x: 0, y: 20, width: width, height: height))
//        subView.backgroundColor = UIColor.blue
//        subView.layer.cornerRadius = 12.0
//        subView.layer.masksToBounds = false
//        subView.layer.shadowOffset = CGSize(width: 1, height: 1)
//        subView.layer.shadowOpacity = 0.5
//        subView.layer.shadowColor = UIColor.black.cgColor
//        subView.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//        subView.layer.shouldRasterize = true
//        subView.layer.rasterizationScale = UIScreen.main.scale
//        
//        titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: width, height: 40))
//        titleLabel.textAlignment = .center
//        titleLabel.textColor = UIColor.orange
//        titleLabel.backgroundColor = UIColor.darkGray
//        titleLabel.layer.cornerRadius = 12.0
//        titleLabel.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
