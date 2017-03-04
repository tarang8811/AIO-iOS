//
//  PasswordViewController.swift
//  AIO
//
//  Created by Tarang on 20/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var teamName : String!
    var showPassword : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up password text field
        passwordTextField.attributedPlaceholder =
            NSAttributedString(string: "Password", attributes:[NSForegroundColorAttributeName : UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.6)])
        passwordTextField.becomeFirstResponder()
        passwordTextField.delegate = self
        passwordTextField.autocorrectionType = .no
        
        teamLabel.text = "Your password for team " + self.teamName

        // set up next button
        nextButton.layer.opacity = 0.5;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func nextVC(_ sender: Any) {
        
        if passwordTextField.text == "andytim"{
            self.dismiss(animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                NotificationCenter.default.post(name: Notification.Name("loginComplete"), object: nil)
            }
            
        }else{
            // set up error label and shaking animation with vibration
            teamLabel.text = "Incorrect password, try again"
            teamLabel.font = UIFont(name: "Lato-Regular", size: 12.0)
            teamLabel.textColor = Layout.UIColorFromHex(colorCode: "195c41", alpha: 1.0)
            
            Layout.shakeAnimationFor(view: passwordTextField)
            Layout.shakeAnimationFor(view: teamLabel)
            Layout.vibrate()
        }
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string  == "" {
            return true
        }else{
            
            // lower the opacity and disable nextButton
            if let textString = textField.text {
                if textString == ""{
                    nextButton.layer.opacity = 0.5;
                    nextButton.isUserInteractionEnabled = false
                }else{
                    nextButton.layer.opacity = 1.0;
                    nextButton.isUserInteractionEnabled = true
                }
                
                textField.text = textString + string
                return false
            }
            return true
        }
    }

    // toggle show/hide password
    @IBAction func toggleShowHidePassword(_ sender: Any) {
        
        showPassword = !showPassword
        if showPassword{
            passwordTextField.isSecureTextEntry = false
        }else{
            passwordTextField.isSecureTextEntry = true
        }
    }
}
