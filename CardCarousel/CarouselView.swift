//
//  CarouselView.swift
//  CardCarousel
//
//  Created by Reona Kubo on 2018/06/10.
//  Copyright © 2018年 Reona Kubo. All rights reserved.
//

import UIKit

class CarouselView: UICollectionView {
    
    private let cellIdentifier = "carousel"
    private let colors = [UIColor.blue, UIColor.yellow, UIColor.red, UIColor.green, UIColor.gray]
    private let titles = ["1", "2", "3", "4", "5"]
    
    private var pageTabItemsWidth: CGFloat = 0
    private let pageCount = 5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(CarouselCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    convenience init(frame: CGRect){
        let layout = PerCellPagingFlowLayout()
        layout.itemSize = CGSize(width: 200, height: frame.height/2)
        layout.minimumLineSpacing = -120
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        self.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cells = visibleCells
        for cell in cells {
            let cellCenter = self.convert(cell.center, to: nil)
            let screenCenterX = UIScreen.main.bounds.width/2
            //真ん中までの距離
            let cellCenterDisX = abs(screenCenterX - cellCenter.x)
            let s = -0.0009 * cellCenterDisX + 1
            cell.transform = CGAffineTransform(scaleX: s, y: s)
            cell.layer.zPosition = (1-abs(cellCenterDisX))
        }
    }
}

extension CarouselView: UICollectionViewDelegate {
    
}

extension CarouselView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageCount * 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UICollectionViewCell, indexPath: IndexPath) {
        guard let cell = cell as? CarouselCell else { return }
        let fixedIndex = indexPath.row % pageCount
        
        cell.contentView.layer.borderColor = colors[fixedIndex].cgColor
        cell.titleLabel.text = titles[fixedIndex]
    }
}

extension CarouselView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if pageTabItemsWidth == 0 {
            // 表示したい要素群のwidthを計算
            pageTabItemsWidth = floor(scrollView.contentSize.width/3)
        }
        
        if (scrollView.contentOffset.x <= 0) || (pageTabItemsWidth*2 < scrollView.contentOffset.x) {
            // スクロールした位置がしきい値を超えたら中央に戻す
            scrollView.contentOffset.x = pageTabItemsWidth
        }
    }
}
