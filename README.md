

## AlertView

This is a Simple alert view for iOS supported with all devices and its done by Swift 3.0.

![Screenshot](https://github.com/ssowri1/AlertView/blob/master/Screeshot.gif?raw=true)


## Installation

### simple way to show alert view

Just put the below code snippet to your class

        alertView = AlertVw(title:"Congratulations!", description:"You have registered successfully", image:#imageLiteral(resourceName: "success"))
        alertView.show(animated: true)


### Properties of Alert view

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

## Authors

[Ssowri1](https://github.com/ssowri1)

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details

## Support or Contact

Having trouble with Pages? Kindly [contact support](https://github.com/contact) and we’ll help you sort it out.
