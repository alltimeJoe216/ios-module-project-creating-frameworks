//
//  TestLoadingViewController.swift
//  LoadingIndicatorFrameworkDev
//
//  Created by Marissa Gonzales on 6/17/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

@IBDesignable class TestLoadingViewController: LoadingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dimension: CGFloat = 100
        let testRect = CGRect(x: view.center.x - dimension/2,
                              y: view.center.y - dimension/2,
                              width: dimension,
                              height: dimension)
        let testView = UIView(frame: testRect)
        testView.backgroundColor = .blue
        view.addSubview(testView)
        load(on: testView)
    }
}
