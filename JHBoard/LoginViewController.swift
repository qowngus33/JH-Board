//
//  LoginViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2021/12/30.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func goLogin(_ sender: Any) {
        
        guard let username = usernameTextField.text, !username.isEmpty else { return } // 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        let loginSuccess: Bool = findUser(name: username, password: password)
        
        if loginSuccess {
            // 01. UIAlertController의 인스턴스를 만든다.
            let alertController = UIAlertController(title: "로그인 성공", message: "로그인 성공하였습니다 ☺️", preferredStyle: .alert) // .actionSheet
            
            // 02. UIAlertController에 추가할 Action인 UIAlertAction을 만든다.
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (input: UIAlertAction) -> Void in
                let main = ViewController()
                                self.present(main, animated: true, completion: nil)
                            })
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            
                            // 03. UIAlertController에 UIAlertAction을 추가한다.
                            alertController.addAction(okAction)
                            alertController.addAction(cancelAction)
                            
                            // 04. UIAlertController를 self(뷰콘트롤러)에 최종적으로 추가한다.
                            self.present(alertController, animated: true, completion: nil)
                 
                        }else {
                            UIView.animate(withDuration: 0.1, animations: {
                                self.usernameTextField.frame.origin.x -= 10
                                self.passwordTextField.frame.origin.x -= 10
                            }, completion: { _ in
                                
                                UIView.animate(withDuration: 0.1, animations: {
                                    self.usernameTextField.frame.origin.x += 20
                                    self.passwordTextField.frame.origin.x += 20
                                }, completion: { _ in
                                    UIView.animate(withDuration: 0.1, animations: {
                                        self.usernameTextField.frame.origin.x -= 10
                                        self.passwordTextField.frame.origin.x -= 10
                                    })
                                })
                            })
                        }
        
        
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
        //guard 조건 else {조건이 false인 경우 수행되는 구문}
        
    }


    @objc func didEndOnExit(_ sender: UITextField) {
        if usernameTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        }else if passwordTextField.isFirstResponder {
            loginButton.becomeFirstResponder()
        }
    }
    
    func findUser(name: String, password: String) -> Bool {
        guard let userList: [[String:String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String : String]] else { return false }
        
        UserDefaults.standard.object(forKey: "UserList")
        
        for userData in userList {
            let memberID: String = userData["ID"]!
            let memberPWD: String = userData["PWD"]!
            if name == memberID && password == memberPWD {
                return true
            }
        }
        return false
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
