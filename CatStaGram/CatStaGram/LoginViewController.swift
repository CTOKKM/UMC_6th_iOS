//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by KKM on 5/14/24.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor
        = text.isValidEmail() ? .facebook : .disabledButton
        self.email = text
         
    }
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor = text.count > 2 ? .facebook : .disabledButton
        self.password  = text
    }
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        print("눌럿다고")
        guard let userInfo = self.userInfo else { return }
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("다음")
        } else {
            
        }
        
    }
    @IBAction func registerButtonDidTap(_ sender: Any) {
        // 2
        let registerViewController = storyboard?.instantiateViewController(identifier: "RegisterVC") as! RegisterViewController
        
        //3
//        self.present(registerViewController, animated: true, completion: nil )
        self.navigationController?.pushViewController(registerViewController, animated: true )
        
        registerViewController.userInfo = { [weak self] (UserInfo) in
            self?.userInfo = UserInfo
            
        }
    }
    
    
    
    
    private func setupAttribute() {
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebook
        
        let attributes = generateButtonAttribute(self.registerButton, texts: text1, text2, fonts: font1, font2, colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
}
