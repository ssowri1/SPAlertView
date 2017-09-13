//
//  alertProtocol.swift
//  AlertView
//
//  Created by Sowrirajan Sugumaran on 9/13/17.
//  Copyright © 2017 Sowrirajan Sugumaran. All rights reserved.
//

import Foundation
import UIKit

// Protocol for showing and dissmising alert view
protocol alertProtocol {
    func show(animated:Bool)
    func dismiss(animated:Bool)
    var backgroundView:UIView{get}
    var dialogView:UIView {get set}
    var appearFrom:String {get}
    var clearBackground : Bool {get}
}

extension alertProtocol where Self:UIView{
    
    func show(animated:Bool){
        
        // Set origin before Animation
        if appearFrom == "top" {
            self.dialogView.center = CGPoint(x:self.center.x, y:-self.frame.height+self.dialogView.frame.size.height/2)
        }else if appearFrom == "bottom" {
            self.dialogView.center = CGPoint(x:self.center.x, y:self.frame.height+self.dialogView.frame.size.height/2)
        }else if appearFrom == "left" {
            self.dialogView.center = CGPoint(x:-self.frame.size.width, y:self.frame.height/2)
        }else {
            self.dialogView.center = CGPoint(x:self.frame.size.width, y:self.frame.height/2)
        }
        
        self.backgroundView.alpha = 0
        UIApplication.shared.delegate?.window??.rootViewController?.view.addSubview(self)
        if animated {
            
            UIView.animate(withDuration: 0.33, animations: {
                if self.clearBackground == true{
                    self.backgroundView.alpha = 0
                }else{
                    self.backgroundView.alpha = 0.66
                }
            })
            // Set origin during Animation
            UIView.animate(withDuration: 0.33, delay:0, usingSpringWithDamping:0.7, initialSpringVelocity:10, options:UIViewAnimationOptions(rawValue:0), animations: {
                self.dialogView.center = self.center
            })
        }else{
            if self.clearBackground == true{
                self.backgroundView.alpha = 0
            }else{
                self.backgroundView.alpha = 0.66
            }
            self.dialogView.center = self.center
        }
    }
    
    
    func dismiss(animated:Bool) {
        
        if animated {
            UIView.animate(withDuration: 0.33, animations: {
                self.backgroundView.alpha = 0
            })
            
            UIView.animate(withDuration: 0.33, delay:0, usingSpringWithDamping: 1, initialSpringVelocity:10, options:UIViewAnimationOptions(rawValue:0), animations: {
                
                if self.appearFrom == "top" {
                    self.dialogView.center = CGPoint(x:self.center.x, y:-self.frame.height+self.backgroundView.frame.size.height/2)
                }else if self.appearFrom == "bottom" {
                    self.dialogView.center = CGPoint(x:self.center.x, y:self.frame.height+self.dialogView.frame.size.height/2)
                }else if self.appearFrom == "left" {
                    self.dialogView.center = CGPoint(x:-self.frame.size.width, y:self.frame.height/2)
                }else {
                    self.dialogView.center = CGPoint(x:self.frame.size.width+self.dialogView.frame.size.width, y:self.frame.height/2)
                }
                
                
            }) { (completed) in
                self.removeFromSuperview()
            }
            
        }else{
            self.removeFromSuperview()
        }
    }
}
