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
            if let removable = self.view.viewWithTag(100) {
                removable.removeFromSuperview()
            }
        }
        else {
            shakeTextField(textField: usernameTextField)
            /*let emailLabel = UILabel(frame: CGRect(x: 68, y: 350, width: 279,height: 45))
                emailLabel.text = "이메일 형식을 확인해 주세요"
                emailLabel.textColor = UIColor.red
                emailLabel.tag = 100
                
                self.view.addSubview(emailLabel)*/
        } // 이메일 형식 오류
        
        if userModel.isValidPassword(pwd: password){
            if let removable = self.view.viewWithTag(101) {
                removable.removeFromSuperview()
            }
        }
        else{
            shakeTextField(textField: passwordTextField)
            /* let passwordLabel = UILabel(frame: CGRect(x: 68, y: 435, width: 279, height: 45))
            passwordLabel.text = "비밀번호 형식을 확인해 주세요"
            passwordLabel.textColor = UIColor.red
            passwordLabel.tag = 101
            
            self.view.addSubview(passwordLabel)*/
        } // 비밀번호 형식 오류
        
        if password == conformPwd {
                   if let removable = self.view.viewWithTag(102) {
                       removable.removeFromSuperview()
                   }
               }
               else {
                   shakeTextField(textField: passwordConformTextField)
                   let passwordConfirmLabel = UILabel(frame: CGRect(x: 70, y: 670, width: 279, height: 45))
                   passwordConfirmLabel.text = "비밀번호가 다릅니다."
                   passwordConfirmLabel.textColor = UIColor.red
                   passwordConfirmLabel.tag = 102
                   
                   self.view.addSubview(passwordConfirmLabel)
               }
                
        if userModel.isValidEmail(id: username) && userModel.isValidPassword(pwd: password) && password == conformPwd {
                let joinFail: Bool = isUser(id: username)
                if joinFail {
                    print("이메일 중복")
                    shakeTextField(textField: usernameTextField)
                    let joinFailLabel = UILabel(frame: CGRect(x: 68, y: 510, width: 279, height: 45))
                    joinFailLabel.text = "이미 가입된 이메일입니다."
                    joinFailLabel.textColor = UIColor.red
                    joinFailLabel.tag = 103
                    
                    self.view.addSubview(joinFailLabel)
                }
                else {
                    print("가입 성공")
                    if let removable = self.view.viewWithTag(103) {
                        removable.removeFromSuperview()
                    }
                    self.performSegue(withIdentifier: "showMap", sender: self)
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


