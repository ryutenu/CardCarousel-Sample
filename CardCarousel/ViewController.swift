//
//  ViewController.swift
//  CardCarousel
//
//  Created by Reona Kubo on 2018/06/10.
//  Copyright © 2018年 Reona Kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var carouselView: CarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = view.frame.width
        let height = view.frame.height
        
        carouselView = CarouselView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        carouselView.center = CGPoint(x: width/2, y: height/2)
        carouselView.backgroundColor = .white
        view.addSubview(carouselView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView.scrollToItem(at: IndexPath(row: 5, section: 0), at: .centeredHorizontally, animated: false)
    }
}
