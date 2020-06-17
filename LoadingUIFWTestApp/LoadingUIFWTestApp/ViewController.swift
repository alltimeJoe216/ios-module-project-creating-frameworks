//
//  ViewController.swift
//  LoadingUIFWTestApp
//
//  Created by Marissa Gonzales on 6/17/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit
import LoadingIndicatorFrameworkDev


class ViewController: LoadingViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let testRect = CGRect(x: 50,
                              y: 50,
                              width: 50,
                              height: 50)
        let testView = UIView(frame: testRect)
        testView.backgroundColor = .systemRed
        view.addSubview(testView)
        print(testView.center)
        load(on: testView)
    }
    
    
}

