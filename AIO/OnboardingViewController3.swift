//
//  OnboardingViewController3.swift
//  AIO
//
//  Created by Tarang on 18/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit

class OnboardingViewController3: UIViewController {

    var superview : UIViewController!
    var animated : Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set up the view for the scroll view
    func showInView( view : UIView, superView : UIViewController){
        self.superview = superView
        self.view.frame = CGRect(x: 2 * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(self.view)
        
    }
    
    // animate the view
    func animate(){
        if !animated{
            
            UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.imageView.transform = CGAffineTransform.identity
            }, completion: nil)
            
            animated = true;
        }
        
    }

}
