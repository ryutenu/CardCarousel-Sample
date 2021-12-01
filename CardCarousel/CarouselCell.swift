//
//  CarouselCell.swift
//  CardCarousel
//
//  Created by Reona Kubo on 2018/06/10.
//  Copyright © 2018年 Reona Kubo. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        // ここで配置する
        let margin: CGFloat = 15
        let width = contentView.frame.width
        let height = contentView.frame.height
        
        titleLabel = UILabel(frame: CGRect(x: margin, y: margin, width: width - margin*2, height: 50))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        contentView.addSubview(titleLabel)
        
        contentView.backgroundColor = UIColor.white
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowOffset = CGSize(width: 1,height: 1)
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowRadius = 5
    }
}
