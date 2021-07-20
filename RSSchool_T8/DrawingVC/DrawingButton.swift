//
//  DrawingButton.swift
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 20.07.2021.
//

import UIKit

class DrawingButton: MyButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.isHighlighted = false
        self.layer.shadowRadius = 3
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.init(named: "LightGreenSea")?.cgColor
        
        UIView.performWithoutAnimation {
            self.isHighlighted = false
        }
    }
}
