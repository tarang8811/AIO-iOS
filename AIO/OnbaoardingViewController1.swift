//
//  OnbaoardingViewController1.swift
//  AIO
//
//  Created by Tarang on 18/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class OnbaoardingViewController1: UIViewController {

    var superview : UIViewController!
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
        imageView2.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
        imageView3.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
        
        // Do any additional setup after loading the view.
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.imageView1.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 0.6, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.imageView2.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.2, delay: 1.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.imageView3.transform = CGAffineTransform.identity
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set up the view for the scroll view
    func showInView( view : UIView, superView : UIViewController){
        self.superview = superView
        self.view.frame = CGRect(x: 0 * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(self.view)
        
    }
    

}
