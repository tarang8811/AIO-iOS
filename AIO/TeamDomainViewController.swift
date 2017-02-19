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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.attributedPlaceholder =
            NSAttributedString(string: "team-name.slack.com", attributes:[NSForegroundColorAttributeName : UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.6)])
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        
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
        var curString = textField.text
        let extensionString = ".slack.com"
        if curString?.range(of:".slack.com") != nil{
            let endIndex = curString?.index((curString?.endIndex)!, offsetBy: -10)
            let truncated = curString?.substring(to: endIndex!)
            curString = truncated
        }
        
        curString! += extensionString
        textField.text = curString
        return true
    }

    @IBAction func nextVC(_ sender: Any) {
        
        
    }
}
