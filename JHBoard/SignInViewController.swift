//
//  SignInViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2021/12/28.
//
/*
import UIKit
class SignInViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("SignInViewController loadView")
    }
    
    
    var userModel = UserModel()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SignInViewController viewDidLoad")
        // Keyboard 내리기
        usernameTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        passwordTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
    }

    // SignIn 버튼을 눌렀을 때
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty else { return } // 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        // Plist로 유저 검사
        // let loginSuccess: Bool = userModel.findUser(name: username, pwd: password)
        let loginSuccess: Bool = findUser(name: username, password: password)
        if loginSuccess {
            
            // 01. UIAlertController의 인스턴스를 만든다.
            let alertController = UIAlertController(title: "로그인 성공", message: "로그인 성공하였습니다 ☺️", preferredStyle: .alert) // .actionSheet
            
            // 02. UIAlertController에 추가할 Action인 UIAlertAction을 만든다.
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (input: UIAlertAction) -> Void in
                let main = MainViewController()
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
        
        
}*/
