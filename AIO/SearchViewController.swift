//
//  SearchViewController.swift
//  AIO
//
//  Created by Tarang on 21/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.barTintColor = UIColor.clear
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.layer.borderColor = Layout.UIColorFromHex(colorCode: "c0c0c0").cgColor
        self.searchBar.layer.cornerRadius = 4.0
        self.searchBar.layer.borderWidth = 0.5

        self.searchBar.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
