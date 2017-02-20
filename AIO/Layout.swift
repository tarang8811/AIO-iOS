//
//  Layout.swift
//  AIO
//
//  Created by Tarang on 18/02/17.
//  Copyright © 2017 Tarang. All rights reserved.
//

import UIKit
import AudioToolbox

class Layout: NSObject {
    
    // set the corner radius of the view
    static func addCornerRadius(view : UIView, cornerRadius : CGFloat){
        view.layer.cornerRadius = cornerRadius
    }
    
    // convert hex to UIColor
    static func UIColorFromHex(colorCode: String, alpha: Float = 1.0) -> UIColor {
        let scanner = Scanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    // shake animation for the view
    static func shakeAnimationFor(view : UIView){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x:view.center.x - 10, y:view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:view.center.x + 10, y:view.center.y))
        view.layer.add(animation, forKey: "position")
    }
    
    // vibrate the gadget
    static func vibrate(){
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }

}
