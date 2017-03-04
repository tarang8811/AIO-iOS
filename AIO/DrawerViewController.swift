//
//  DrawerViewController.swift
//  AIO
//
//  Created by Tarang on 19/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit
import SWRevealViewController

class DrawerViewController: UIViewController {

    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var iconButton: UIButton!
    @IBOutlet weak var searchContainerView: UIView!
    
    let app = UIApplication.shared
    
    
    var channels: [Channel] = []
    var privateChannels: [Channel] = []
    var directMessages: [String] = []
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        
        return UIStatusBarAnimation.slide
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addDummyData()
        myScrollView.isPagingEnabled = true
        pageControl.numberOfPages = 3
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionFooterHeight = 0
        searchBar.delegate = self
        var bounds = searchBar.frame
        bounds.size.height = 40
        
        
        
        
        if self.revealViewController() != nil {
            
            self.revealViewController().delegate = self
            self.contentView.frame.size.width = self.revealViewController().rearViewRevealWidth
        }
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        setLocalization()
        
        
        
        self.view.layoutSubviews()
        myScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDummyData () {
        
        let channel1 = Channel(name: "general")
        let channel2 = Channel(name: "random")
        
        let priChannel1 = Channel(name: "ideas")
        let priChannnel2 = Channel(name: "updates")
        
        self.channels = [channel1,channel2]
        self.privateChannels = [priChannel1, priChannnel2]
        
        let message1 = "slackbot"
        let message2 = "andytlim"
        let message3 = "amy"
        let message4 = "hollyash"
        let message5 = "kim"
        let message6 = "m"
        
        self.directMessages = [message1, message2, message3, message4, message5, message6]
        
        tableView.reloadData()
    }
    
    func setLocalization () {
        
        
        iconButton.layer.cornerRadius = 8.0
        
        if self.revealViewController() != nil {
//            self.view.bounds.size.width = self.revealViewController().rearViewRevealWidth
//            self.view.sizeToFit()
//            print(self.revealViewController().rearViewRevealWidth)
//            print(self.scrollView.frame.size.width)
            
        }
        
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = Layout.UIColorFromHex(colorCode: "2E222C")
//        self.searchBar.backgroundImage = UIImage()
        searchBar.layer.borderColor = Layout.UIColorFromHex(colorCode: "2E222C").cgColor
        searchBar.layer.cornerRadius = 6.0
        searchBar.layer.borderWidth = 0.5
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        let str = NSAttributedString(string: "Jump to conversation...", attributes: [NSForegroundColorAttributeName: Layout.UIColorFromHex(colorCode: "584C56")])
    
        textFieldInsideSearchBar?.attributedPlaceholder = str
        
//        for subView in searchBar.subviews  {
//            
//            print("class is \(subView.classForCoder)")
//            
//            for subsubView in subView.subviews  {
//                if let textField = subsubView as? UITextField {
//                    var bounds: CGRect
//                    bounds = textField.frame
//                    bounds.size.height = 1.9*self.iconButton.frame.size.height
//                    bounds.origin.y = self.iconButton.frame.origin.y + 0.05
//                    textField.bounds = bounds
//                    
//                    
//                    textField.borderStyle = UITextBorderStyle.roundedRect
//                    textField.layer.borderWidth = 3.0
//                    textField.layer.cornerRadius = 50.0
//                    textField.layer.borderColor = UIColor.red.cgColor
//                    
//                    textField.textAlignment = NSTextAlignment.natural
//                    
//                    textField.autoresizingMask = UIViewAutoresizing.flexibleWidth
//                    
//                    
//                    
//                    //                    textField.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
//                }
//            }
//        }
        
        
        
    }
    
//    override func setNeedsStatusBarAppearanceUpdate() {
//        super.setNeedsStatusBarAppearanceUpdate()
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}

extension DrawerViewController: SWRevealViewControllerDelegate {
    
    func revealControllerPanGestureBegan(_ revealController: SWRevealViewController!) {
        print("Pan gesture began!")
    }
    
    func revealControllerPanGestureEnded(_ revealController: SWRevealViewController!) {
        print("Pan Gesture ended!")
        
    }
    
    
}

extension DrawerViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == Constants.tagValueForLeftMenuTableView {
            return 4
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1;
        case 1:
            return channels.count;
        case 2:
            return privateChannels.count;
        case 3:
            return directMessages.count;
        default:
            return 1;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifierForLeftMenuCell, for: indexPath) as! LeftMenuTableViewCell
        
        
        
        
        cell.nameLabel.text = "\(indexPath.row)"
        cell.selectionStyle = UITableViewCellSelectionStyle.default
        
        if indexPath.section == 0 {
            cell.nameLabel?.font = UIFont(name: Constants.fontNameForLeftMenuTableViewCellLabels, size: 19.0)
            cell.nameLabel?.textColor = Layout.UIColorFromHex(colorCode: "CCC0CA")
            cell.nameLabel?.text = "All Threads"
            cell.iconImageView.image = UIImage(named: "threads")
        } else if indexPath.section == 1 {
            
            cell.nameLabel?.font = UIFont(name: Constants.fontNameForLeftMenuTableViewCellLabels, size: 17.0)
            cell.nameLabel?.text = self.channels[indexPath.row].name
            cell.iconImageView.isHidden = true
            cell.iconButton.isHidden = false
            
        } else if indexPath.section == 2 {
            cell.nameLabel?.font = UIFont(name: Constants.fontNameForLeftMenuTableViewCellLabels, size: 17.0)
            cell.nameLabel?.text = self.privateChannels[indexPath.row].name
            cell.iconImageView.image = UIImage(named: "lock")
        } else if indexPath.section == 3 {
            cell.nameLabel?.font = UIFont(name: Constants.fontNameForLeftMenuTableViewCellLabels, size: 17.0)
            cell.nameLabel?.text = self.directMessages[indexPath.row]
            cell.iconImageView.image = UIImage(named: "offline")
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifierForLeftMenuSection) as! LeftMenuTableViewSection
        header.nameLabel?.font = UIFont(name: Constants.fontNameForLeftMenuTableViewCellLabels, size: 12.0)
        
//        header.iconButton.imageView?.image = UIImage(named: "plus_icon")
        
        
        
        
        if section == 0 {
            return nil
        } else if section == 1 {
            header.nameLabel.text = "CHANNELS"
            
        } else if section == 2 {
            header.nameLabel.text = "PRIVATE CHANNELS".uppercased()
        } else if section == 3 {
            header.nameLabel.text = "DIRECT MESSAGES".uppercased()
        }
        
        
        return header
        
    }
    
}

extension DrawerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 33.0
            }
        } else {
            
            return 30
            
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0{
            return 0
        }
        
        return 35
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}

extension DrawerViewController: UISearchBarDelegate {
    
    
    
    
}
