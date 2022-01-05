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
    
    var userModel = UserModel()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func goLogin(_ sender: Any) {
        
        guard let username = usernameTextField.text, !username.isEmpty else {
            alert(message: "이메일을 입력해주세요")
            return
        } // 예외 처리 : Textfield가 빈문자열이 아니고, nil이 아닐 때
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(message: "비밀번호를 입력해주세요")
            return
        }
        
        let loginSuccess: Bool = userModel.findUser(name: username, pwd: password)
        
        if loginSuccess {
            // 01. UIAlertController의 인스턴스를 만든다.
           /* let alertController = UIAlertController(title: "로그인 성공", message: "로그인 성공하였습니다 ☺️", preferredStyle: .alert) // .actionSheet
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
            */
            
            
            guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController else { return }
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
            //guard 조건 else {조건이 false인 경우 수행되는 구문}
            
           
            
                 
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
                    //잘못 입력했을 경우 좌우로 흔들리는 애니메이션
                    
                
                }
        
    
        
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        
       /*guard let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpView") as? ViewController else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(SignUpVC, animated: false)*/
        
        let vcName = self.storyboard?.instantiateViewController(withIdentifier: "SignUpView")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segue.destination은 UIViewController의 상속을 받은 Down캐스팅(형변환)이기 때문에 안전하게 옵셔널 체이닝
            // segue.source 는 previous ViewController인 SignInViewController
            if let nextViewController = segue.destination as? SignUpViewController {
               // SignUpViewController의 didTaskClosure에 클로저를 만들어서 담아 보낸다.
                nextViewController.didTaskClosure = {
                    (name: String, password: String) -> Void in return
                    self.userModel.addUser(name: name, pwd: password)
                }
            }
        }

}
