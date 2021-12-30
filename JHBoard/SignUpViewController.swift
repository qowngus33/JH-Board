//
//  SignUpViewController.swift
//  JHBoard
//
//  Created by 배주현 on 2021/12/30.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    var userModel = UserModel()
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConformTextField: UITextField!
        // SignInViewController 에서 넘어올 클로저를 받을 변수
    
    @IBOutlet weak var emailErrorText: UILabel!
    @IBOutlet weak var passwordErrorText: UILabel!
    @IBOutlet weak var passwordCfErrorText: UILabel!
    
    func isUser(id: String) -> Bool {
        for user in userModel.model {
            if user.username == id {
                return true
            }
        }
        
        return false
    }
    
    /*****ViewDidLoad*****/
        /*****Return Key addTarget*****/
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        passwordTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
        passwordConformTextField.addTarget(self, action: #selector(didEndOnExit), for: UIControl.Event.editingDidEndOnExit)
    }
        
    
    var didTaskClosure: ((String, String) -> Void)? = nil
        
        
    @IBAction func signUpBtn(_ sender: Any) {
        guard let username = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let conformPwd = passwordConformTextField.text else { return }
        
        
        if userModel.isValidEmail(id: username)
        {
            emailErrorText.text = ""
        } else {
            shakeTextField(textField: usernameTextField)
            emailErrorText.text = "이메일 형식을 확인해주세요"
            
        } // 이메일 형식 오류
        
        if userModel.isValidPassword(pwd: password)
        {
            passwordErrorText.text = ""
        } else {
            shakeTextField(textField: passwordTextField)
            passwordErrorText.text = "비밀번호 형식을 확인해 주세요"
        } // 비밀번호 형식 오류
        
        if password == conformPwd
        {
               
            passwordCfErrorText.text = ""
        }
        else
        {
            shakeTextField(textField: passwordConformTextField)
            passwordCfErrorText.text = "비밀번호가 다릅니다."
        }
                
        if userModel.isValidEmail(id: username) && userModel.isValidPassword(pwd: password) && password == conformPwd
        {
            let joinFail: Bool = isUser(id: username)
            
            if joinFail
            {
                print("이메일 중복")
                shakeTextField(textField: usernameTextField)

                emailErrorText.text = "이미 가입된 이메일입니다."

            }
            else
            {
                print("가입 성공")
                
                guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController else { return }
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
            }
        }
    }
    
    // Exit Function
    @IBAction func didTapExitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil) // 화면 내리기
    }
    
   
    /*****Keyboard 내리기 Function*****/
    @objc func didEndOnExit(_ sender: UITextField) {
        if usernameTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        }else if passwordTextField.isFirstResponder {
            passwordConformTextField.becomeFirstResponder()
        }
    }
    
    func shakeTextField(textField: UITextField) -> Void{
            UIView.animate(withDuration: 0.2, animations: {
                textField.frame.origin.x -= 10
            }, completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    textField.frame.origin.x += 20
                }, completion: { _ in
                    UIView.animate(withDuration: 0.2, animations: {
                        textField.frame.origin.x -= 10
                    })
                })
            })
        }
        
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


