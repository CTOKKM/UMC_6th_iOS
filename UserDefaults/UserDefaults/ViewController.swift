//
//  ViewController.swift
//  UserDefaults
//
//  Created by KKM on 6/20/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var PWField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    let myUserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myUserDefaults.string(forKey: "IDKey")
        myUserDefaults.string(forKey: "PWKey")
        
    }

    @IBAction func LoginAction(_ sender: Any) {
        // 로그인 검사
        if IDField.text == myUserDefaults.string(forKey: "IDKey") {
            if PWField.text == myUserDefaults.string(forKey: "PWKey") {
                textLabel.text = IDField.text! + "님 환영합니다."
            } else {
                textLabel.text = "비밀번호 불일치"
            }
        } else {
            textLabel.text = "존재하지 않는 아이디"
        }
    }
    
    @IBAction func SignupAction(_ sender: Any) {
        if IDField.text == myUserDefaults.string(forKey: "IDKey") {
            textLabel.text = "이미 존재하는 아이디"
        } else {
            myUserDefaults.set(IDField.text, forKey: "IDKey")
            myUserDefaults.set(PWField.text, forKey: "PWKey")
            textLabel.text = "회원가입 성공"
        }
    }
    
    

}

