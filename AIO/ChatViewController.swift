//
//  ChatViewController.swift
//  AIO
//
//  Created by Tarang on 19/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit
import SWRevealViewController

class ChatViewController: UIViewController {
    @IBOutlet weak var rightMenuButton: UIButton!
    @IBOutlet weak var leftMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            self.revealViewController().rightViewRevealOverdraw = 0
            leftMenuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)) , for: .touchUpInside)
            rightMenuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.rightRevealToggle(_:)) , for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
