//
//  ViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2021/12/28.
//

import UIKit
import Foundation

class ViewController: UIViewController {
   
    @IBAction func logoutBtn(_ sender: Any) {
        let alert = UIAlertController(title: "로그아웃 확인", message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .destructive) { (_) in

            let vcName = self.storyboard?.instantiateViewController(withIdentifier: "LoginView")
                    vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
            vcName?.modalTransitionStyle = .coverVertical //전환 애니메이션 설정
                    self.present(vcName!, animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        //취소 action
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
   /* lazy var activityIndicator: UIActivityIndicatorView = { // Create an indicator.
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: -10, width: 50, height: 50)
        activityIndicator.center = self.view.center
        // Also show the indicator even when the animation is stopped.
        activityIndicator.hidesWhenStopped = false
        activityIndicator.style = UIActivityIndicatorView.Style.large
        // Start animation.
        
        activityIndicator.startAnimating()
        
        return activityIndicator
        
    }()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.view.addSubview(self.activityIndicator)

        // Do any additional setup after loading the view.
    }
    
    
    
    

}

