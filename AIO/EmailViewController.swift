//
//  EmailViewController.swift
//  AIO
//
//  Created by Tarang on 20/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var teamName : String!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up email text field
        emailTextField.attributedPlaceholder =
            NSAttributedString(string: "Email Address", attributes:[NSForegroundColorAttributeName : UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.6)])
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        emailTextField.autocorrectionType = .no
        errorLabel.isHidden = true;

        // set up next button
        nextButton.layer.opacity = 0.5
        nextButton.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func back(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true);
    }
    
    @IBAction func nextVC(_ sender: Any) {
        
        if emailTextField.text == "andytim@gmail.com"{
            self.performSegue(withIdentifier: "toPasswordVC", sender: nil)
            
        }else{
            
            // show error label and animate the view with vibration
            errorLabel.isHidden = false;
            errorLabel.text = "No account found. If you're sure you've signed up for " + self.teamName + ".aio.com. you can try another email address"
            errorLabel.font = UIFont(name: "Lato-Regular", size: 12.0)
            errorLabel.textColor = Layout.UIColorFromHex(colorCode: "413366", alpha: 1.0)
            
            Layout.shakeAnimationFor(view: emailTextField)
            Layout.shakeAnimationFor(view: errorLabel)
            Layout.vibrate()
        }
        
    }
    
    // function called when text is being typed in the text field
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
    
    // segue to nextVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPasswordVC"{
            let vc : PasswordViewController = segue.destination as! PasswordViewController
            vc.teamName = self.teamName;
        }
    }
}
