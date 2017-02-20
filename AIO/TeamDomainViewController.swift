//
//  TeamDomainViewController.swift
//  AIO
//
//  Created by Atman Patel on 19/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class TeamDomainViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set up email text field
        emailTextField.attributedPlaceholder =
            NSAttributedString(string: "team-name.slack.com", attributes:[NSForegroundColorAttributeName : UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.6)])
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        emailTextField.autocorrectionType = .no
        
        // set up next button
        nextButton.layer.opacity = 0.5;
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    // Mark -> UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if (textField.text?.characters.count)! > 0{
            nextButton.layer.opacity = 1.0;
            nextButton.isUserInteractionEnabled = true
        }else{
            nextButton.layer.opacity = 0.5;
            nextButton.isUserInteractionEnabled = false
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if (textField.text?.characters.count)! > 0{
            nextButton.layer.opacity = 1.0;
            nextButton.isUserInteractionEnabled = true
        }else{
            nextButton.isUserInteractionEnabled = false
            nextButton.layer.opacity = 0.5;
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        
        if string == "" {
            return true
        } else if var textString = textField.text {
            // code for appending .aio.com at the end of textfield input
            let unitString = ".aio.com"
            if textString.contains(unitString) {
                
                // handle nextButton changes
                if textString == ""{
                    nextButton.isUserInteractionEnabled = false
                    nextButton.layer.opacity = 0.5;
                }else{
                    
                    nextButton.layer.opacity = 1.0;
                    nextButton.isUserInteractionEnabled = true
                    
                }

                textString = textString.replacingOccurrences(of: unitString, with: "")
                textString += string + unitString
                textField.text = textString
                
            } else {
                textField.text = string + unitString
                let end = textField.position(from: textField.beginningOfDocument, offset:string.characters.count)
                textField.selectedTextRange = textField.textRange(from: end!, to: end!)
                nextButton.layer.opacity = 1.0;
                nextButton.isUserInteractionEnabled = true
            }
            
            
            return false
        }
        return true
    }

    @IBAction func nextVC(_ sender: Any) {
        
        if emailTextField.text == "andytim.aio.com"{
            self.performSegue(withIdentifier: "toEmailVC", sender: nil)
            
        }else{
            
            // show error label and animate the view with vibration
            addressLabel.text = "That team doesn't exist, try again."
            addressLabel.font = UIFont(name: "Lato-Regular", size: 12.0)
            addressLabel.textColor = Layout.UIColorFromHex(colorCode: "285a7c", alpha: 1.0)
            
            Layout.shakeAnimationFor(view: emailTextField)
            Layout.shakeAnimationFor(view: addressLabel)
            Layout.vibrate()
            
        }
        
    }
    
    // segue to nextVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEmailVC"{
            let vc : EmailViewController = segue.destination as! EmailViewController
            let textString = emailTextField.text?.replacingOccurrences(of: ".aio.com", with: "")
            vc.teamName = textString;
        }
    }
}
