//
//  ViewController.swift
//  AIO
//
//  Created by Tarang on 18/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createTeamButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var vc1 : OnbaoardingViewController1!
    var vc2 : OnboardingViewController2!
    var vc3 : OnboardingViewController3!
    
    var didAppear : Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Layout.addCornerRadius(view: signInButton, cornerRadius: 5.0)
        
        self.scrollView.delegate = self
        
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.valueChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.goToNextVC(notification:)), name: Notification.Name("loginComplete"), object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        // initiatllize only once
        if !didAppear {
            for i in 0  ..< 3 {
                
                switch i {
                case 0:
                    vc1 = OnbaoardingViewController1(nibName: "OnbaoardingViewController1", bundle: nil)
                    vc1.showInView(view: self.scrollView, superView: self)
                    break
                case 1:
                    vc2 = OnboardingViewController2(nibName: "OnboardingViewController2", bundle: nil)
                    vc2.showInView(view: self.scrollView, superView: self)
                    break
                case 2:
                    vc3 = OnboardingViewController3(nibName: "OnboardingViewController3", bundle: nil)
                    vc3.showInView(view: self.scrollView, superView: self)
                    break
                    
                default: break
                    
                }
                
            }
            
            self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.scrollView.frame.size.height)
            
        }
        
        didAppear = true; 
    }
    
    // Hides the top status bar
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signIn(_ sender: Any) {
        
        
    }

    @IBAction func createTeam(_ sender: Any) {
        
        
    }

    // change page control
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
        
    }
    
    // called when at the end of scroll view swiping
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        
        // animate the second view only once
        if pageNumber == 1 {
            if !vc2.animated{
                vc2.animate()
            }
        }
        // animate the third view only once
        if pageNumber == 2 {
            if !vc3.animated{
                vc3.animate()
            }
        }
    }
    
    func goToNextVC(notification: Notification){
        self.performSegue(withIdentifier: "goToChatVC", sender: nil)
    }
}

