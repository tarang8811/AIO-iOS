//
//  RightDrawerViewController.swift
//  AIO
//
//  Created by Tarang on 22/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class RightDrawerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableview: UITableView!
    
    var sections : [String] = ["profilePic",
                               "secondSection",
                               "thirdSection"]
    
    var tableDictionary : [String : [String]] =
                            [ "profilePic"    : [ "" ],
                              "secondSection" : ["Activity",
                                                "Starred Items",
                                                "Your Files",
                                                "Directory"],
                              "thirdSection"  : [ "Snooze Notification",
                                                "Invite People",
                                                "Edit Profile",
                                                "Settings"]
                            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.tableview.backgroundColor = Layout.UIColorFromHex(colorCode: "f7f7f7")
        //self.tableview.separatorStyle = .none
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionArray = tableDictionary[sections[section]]
        return sectionArray!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            
            let cell : ProfileDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileDetailsTableViewCell
            cell.profilePic.image = UIImage(named: "profilePic")
            cell.profilePic.layer.cornerRadius = 10.0
            cell.profilePic.clipsToBounds = true
            cell.backgroundColor = Layout.UIColorFromHex(colorCode: "f7f7f7")
            cell.separatorInset = UIEdgeInsets(top: 0, left: self.view.frame.size.width, bottom: 0, right: 0)
            
            return cell
            
        }else{
            
            let cell : CellDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellDetailsTableViewCell
            
            var sectionArray = tableDictionary[sections[indexPath.section]]
            let cellName = sectionArray?[indexPath.row]
            
            cell.label.text = cellName
            cell.backgroundColor = Layout.UIColorFromHex(colorCode: "ffffff")
            cell.thumbNail?.image = UIImage(named: cellName!)
            
            if (indexPath.row == 0) {
                cell.topGrayView.isHidden = false;
                cell.bottomGrayView.isHidden = true;
            }else if (indexPath.row == (sectionArray?.count)! - 1){
                cell.topGrayView.isHidden = true;
                cell.bottomGrayView.isHidden = false;
            }else{
                cell.topGrayView.isHidden = true;
                cell.bottomGrayView.isHidden = true;
            }
            
            cell.separatorInset = UIEdgeInsets(top: 0, left: 74, bottom: 0, right: 0)
            
            return cell
        }
    
       
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // spacing only for the last section
        if section == tableDictionary.count - 1{
            return 20
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 200
        }else{
            return (self.view.frame.size.height - 200 - 2) / 8
        }
    }
    
    // Hides the top status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }

    

}
