//
//  ViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2021/12/28.
//

import UIKit

class ViewController: UIViewController {
    

    lazy var activityIndicator: UIActivityIndicatorView = { // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: -10, width: 50, height: 50)
        activityIndicator.center = self.view.center
        // Also show the indicator even when the animation is stopped.
        activityIndicator.hidesWhenStopped = false
        activityIndicator.style = UIActivityIndicatorView.Style.large
        // Start animation.
        
        activityIndicator.startAnimating()
        
        return activityIndicator
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.activityIndicator)

        // Do any additional setup after loading the view.
    }

}

