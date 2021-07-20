//
//  DrawingVC.swift
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 15.07.2021.
//

import UIKit

@objc enum DrawingObject:Int {
    case Tree
    case Head
    case Landscape
    case Planet
}



class DrawingVC: UIViewController {
    @objc public var selectedObject: DrawingObject = .Head
    
    @IBOutlet var buttonsOnScreen: [DrawingButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Drawing"
        
        for button in buttonsOnScreen {
            button.setupMyButton()
            MyButton.addShadowButton(button.layer)
            
            button.addTarget(self,
                             action: #selector(touchButton(sender:)),
                             for: .touchUpInside)
            
            if button.titleLabel?.text == "Head" {
                button.layer.shadowRadius = 3
                button.layer.shadowColor = UIColor.init(named: "LightGreenSea")?.cgColor
            }
        }
    }
    
    @objc func touchButton(sender: DrawingButton) {
        switch sender.titleLabel?.text {
        case "Planet": selectedObject = .Planet
        case "Head": selectedObject = .Head
        case "Tree": selectedObject = .Tree
        case "Landscape": selectedObject = .Landscape
        default: return
        }
        
        for button in buttonsOnScreen {
            if !(button == sender) {
                button.layer.shadowRadius = 2
                button.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            }
        }
    }
}
