//
//  AlertVw.swift
//  AlertView
//
//  Created by Sowrirajan Sugumaran on 9/13/17.
//  Copyright © 2017 Sowrirajan Sugumaran. All rights reserved.
//

import UIKit

class AlertVw: UIView, alertProtocol {
    
    // Declare the protocol controls
    var backgroundView = UIView()
    var dialogView = UIView()
    var appearFrom = String()
    var clearBackground = Bool()
    
    fileprivate var imageView = UIImageView()
    fileprivate var titleLabel = UILabel()
    fileprivate var lblMessage = UILabel()
    fileprivate var btnDone = UIButton()
    
    fileprivate var btnTxtColor : UIColor?
    fileprivate var btnBGColor = UIColor()
    fileprivate var btnFont = UIFont()
    
    fileprivate var lblTitleTxtColor = String()
    fileprivate var lblTitleTxtFont = String()
    
    fileprivate var lblDesTxtColor = String()
    fileprivate var lblDesTxtFont = String()

    
    convenience init(title:String, description:String, image:UIImage) {
        self.init(frame:UIScreen.main.bounds)
        self.initialise(title:title, description:description, image:image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // set title label font
    func setTitleFont(font:UIFont) {
        titleLabel.font = font
    }
    
    // set title label color
    func setTitleColor(color:UIColor) {
        titleLabel.textColor = color
    }
    
    // set description label font
    func setDescriptionFont(font:UIFont) {
        lblMessage.font = font
    }
    
    // set description label color
    func setDescriptionColor(color:UIColor) {
        lblMessage.textColor = color
    }
    
    // set done button title
    func setBtnTitle(name:String) {
        btnDone.setTitle(name as String?, for: UIControlState.normal)
    }
    
    // set done button background color
    public func setBtnBGColor(color:UIColor) {
        btnDone.backgroundColor = color
    }
    
    // set done button text color
    func setBtnTxtColor(color:UIColor) {
        btnDone.titleLabel?.textColor = color
    }
    
    // set done button text font
    public func setBtnFont(font:UIFont) {
        btnDone.titleLabel?.font = font
    }
    
    // set alert view background color
    public func setViewBGColor(color:UIColor) {
        backgroundView.backgroundColor = color
    }
    
    
    func initialise(title:String, description:String, image:UIImage) {
        
        // get dynamic width for alertView and all controlls
        let dialogViewWidth = 260
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.6
        addSubview(backgroundView)
        
        imageView.frame.origin = CGPoint(x: -13, y: -13)
        imageView.frame.size = CGSize(width: 70 , height: 70)
        imageView.image = image
        imageView.layer.cornerRadius = imageView.frame.size.height/2
        imageView.clipsToBounds = true
        imageView.alpha = 0.9
        imageView.contentMode = .scaleAspectFit
        dialogView.addSubview(imageView)
        
        titleLabel.frame = CGRect(x: imageView.frame.size.width-5, y: imageView.frame.size.height/2 - imageView.frame.size.height/4-5, width: CGFloat(dialogViewWidth) + 8, height: 70)
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Futura", size: 22)
        titleLabel.textAlignment = .left
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()
        self.createShadow(view: titleLabel, color: UIColor.black, Offset: CGSize(width:0, height:0), opacity: 0.5, radious: 1)
        dialogView.addSubview(titleLabel)
        
        lblMessage.frame = CGRect(x: 17, y: Int(titleLabel.frame.origin.y + titleLabel.frame.size.height + 8 + 10), width: dialogViewWidth - 30, height: 50)
        lblMessage.numberOfLines = 0
        lblMessage.lineBreakMode = NSLineBreakMode.byWordWrapping
        lblMessage.font = UIFont(name: "Futura", size: 17)
        lblMessage.textAlignment = NSTextAlignment.center
        lblMessage.textColor = UIColor.darkGray
        lblMessage.text = description
        lblMessage.sizeToFit()
        dialogView.addSubview(lblMessage)
        
        btnDone = UIButton(frame: CGRect(x: 8, y:lblMessage.frame.origin.y + lblMessage.frame.size.height + 8, width: 100, height:40))
        btnDone.setTitle("Okay", for: UIControlState.normal)
        btnDone.addTarget(self, action: #selector(didButtonTapped), for: UIControlEvents.touchUpInside)
        btnDone.backgroundColor =  UIColor.darkText
        btnDone.setTitleColor(UIColor.groupTableViewBackground, for: UIControlState.normal)
        btnDone.titleLabel?.font = UIFont(name: "Avenir Next Bold", size: 17)
        self.createShadow(view: btnDone, color: UIColor.black, Offset: CGSize(width:0, height:0), opacity: 0.7, radious: 3)
        dialogView.addSubview(btnDone)
        
        // set dynamic height for alert view and their controls
        let dialogViewHeight = titleLabel.frame.height + 8 + lblMessage.frame.height + 8 + btnDone.frame.height + 8 + 30
        btnDone.frame.origin = CGPoint(x:CGFloat(dialogViewWidth)-105, y:dialogViewHeight-45)
        dialogView.frame.origin = CGPoint(x: 32, y: frame.height)
        dialogView.frame.size = CGSize(width: CGFloat(dialogViewWidth), height: dialogViewHeight)
        dialogView.backgroundColor = UIColor.clear
        self.createGradientLayer(view: dialogView, colorOne: UIColor.white, colorTwo: UIColor.white)
        
        lblMessage.center = CGPoint(x: dialogView.frame.size.width / 2, y: dialogView.frame.size.height/2)
        dialogView.layer.cornerRadius = 10
        dialogView.clipsToBounds = true
        addSubview(dialogView)
        
    }
    
    // dismiss the alert view
    func didButtonTapped() {
        dismiss(animated: true)
    }
    
    // set gradient colors
    func createGradientLayer(view:UIView, colorOne:UIColor, colorTwo:UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // set shadow of controls
    func createShadow(view:UIView, color:UIColor, Offset:CGSize, opacity:Float, radious:Float){
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = Offset
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = CGFloat(radious)
    }
}
