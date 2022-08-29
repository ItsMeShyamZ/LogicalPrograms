//
//  LoginViewController.swift
//  UIUNitTesting
//
//  Created by Shyamala's MacBook Pro on 27/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTxt : UITextField!
    @IBOutlet weak var passwordTxt : UITextField!
    @IBOutlet weak var doneBtn : UIButton!
    
    let userName : String = "Shyamala"
    let password : String = "Password"

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGues = UITapGestureRecognizer(target: self, action: #selector(doneAction))
        doneBtn.addGestureRecognizer(tapGues)
        
    }
    
    @objc func doneAction(){
        if userNameTxt.text == userName && passwordTxt.text == password{
            DispatchQueue.main.asyncAfter(deadline: .now()+10) {
                self.dismiss(animated: true)
            }
            
        }else{
            print("Enter Correct User Name")
        }
    }

}
