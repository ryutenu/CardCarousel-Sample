//
//  PerCellPagingFlowLayout.swift
//  undar
//
//  Created by Reona Kubo on 2018/06/09.
//  Copyright © 2018年 Eggas. All rights reserved.
//

import UIKit

class PerCellPagingFlowLayout: UICollectionViewFlowLayout {
    
    var cellWidth: CGFloat = 200
    let windowWidth: CGFloat = UIScreen.main.bounds.width
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var offsetAdjustment = CGFloat(MAXFLOAT)
        let horizontalOffset = proposedContentOffset.x + (windowWidth - cellWidth)/2
        
        guard let collectionView = collectionView else {
            return proposedContentOffset
        }
        
        let targetRect = CGRect(x: proposedContentOffset.x,
                                y: 0,
                                width: collectionView.bounds.width,
                                height: collectionView.bounds.height)
        
        guard let attributesList = super.layoutAttributesForElements(in: targetRect) else {
            return proposedContentOffset
        }
        
        for attributes in attributesList {
            let itemOffset = attributes.frame.origin.x
            
            if abs(itemOffset - horizontalOffset) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
