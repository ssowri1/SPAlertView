//
//  ViewController.swift
//  AlertView
//
//  Created by Sowrirajan Sugumaran on 9/13/17.
//  Copyright © 2017 Sowrirajan Sugumaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Declare the alertview class
    var alertView = AlertVw()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var typeSegment: UISegmentedControl!
    var direction : String?
    var titleText : String?
    var descriptionText : String?
    var imgAlert : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actAlert(_ sender: Any) {
        
        // simple way to show alert view
        
        alertView = AlertVw(title:"Congratulations!", description:"You have registered successfully.", image:#imageLiteral(resourceName: "success"))
        alertView.show(animated: true)

    }
    
    // to show types of alert view
    @IBAction func alertTypes(_ sender: Any) {
        
        switch self.typeSegment.selectedSegmentIndex {
            
        case 0:
            titleText = "Congratulations!"
            descriptionText = "You have registered successfully"
            imgAlert = #imageLiteral(resourceName: "success")
            break
            
        case 1:
            titleText = "Oops!"
            descriptionText = "Uh-oh you shouldn't register here in this moment"
            imgAlert = #imageLiteral(resourceName: "error")
            break
            
        case 2:
            titleText = "Catution!"
            descriptionText = "We are under in construction due to update our datas and the hardware. could you please try after some time. we are happy to serve with you. Thank you for your appearance"
            imgAlert = #imageLiteral(resourceName: "caution")
            break
            
        case 3:
            titleText = "Info!"
            descriptionText = "It takes more than minutes"
            imgAlert = #imageLiteral(resourceName: "info")
            break
            
        default:
            break;
        }
        self.actShowAlert(title: titleText!, description: descriptionText!, imageName: imgAlert!, direction : direction ?? "top", clearBG: false)
    }
    
    // to set alert view direction
    @IBAction func indexChanged(_ sender: Any) {
        
        switch self.segmentControl.selectedSegmentIndex {
        case 0:
            direction = "top"
            break
            
        case 1:
            direction = "bottom"
            break
            
        case 2:
            direction = "left"
            break
            
        case 3:
            direction = "right"
            break
            
        default:
            break;
        }
        self.actShowAlert(title: titleText ?? "Congratulations!", description: descriptionText ?? "You have registered successfully.", imageName: imgAlert ?? #imageLiteral(resourceName: "success"), direction: direction ?? "top", clearBG: false)
    }
    
    func actShowAlert(title : String, description : String, imageName : UIImage, direction: String, clearBG: Bool) {
        
        alertView = AlertVw(title:title, description:description, image:imageName)          // set the values
        
        //************** To Change The Properties of Controls *******************
        alertView.setTitleFont(font:UIFont(name: "Futura", size: 20)!)                      // set title label font
        alertView.setTitleColor(color:UIColor.black)                                        // set title label color
        alertView.setDescriptionFont(font:UIFont(name: "Futura", size: 17)!)                // set description label font
        alertView.setDescriptionColor(color:UIColor.darkGray)                               // set description label color
        alertView.setBtnTitle(name: "Done")                                                 // set done button title
        alertView.setBtnBGColor(color: UIColor.black)                                       // set done button background color
        alertView.setBtnTxtColor(color: UIColor.black)                                      // set done button text color
        alertView.setBtnFont(font:UIFont(name: "Futura", size: 17)!)                        // set done button text font
        alertView.setViewBGColor(color: UIColor.black)                                      // set alert view background color
        alertView.clearBackground = clearBG                                                 // set background color
        alertView.appearFrom = direction                                                    // set direction of alert view
        //************** To Change The Properties of Controls *******************

        alertView.show(animated: true)                                                      // to show alert view
    }
    
    // to clear background color of alert view
    @IBAction func actClearBackground(_ sender: UISwitch) {
        let boolValue : Bool
        if sender.isOn {
            boolValue = true
        }else{
            boolValue = false
        }
        self.actShowAlert(title: titleText ?? "Congratulations!", description: descriptionText ?? "You have registered successfully.", imageName: imgAlert ?? #imageLiteral(resourceName: "success"), direction: direction ?? "top", clearBG: boolValue)
    }
}

