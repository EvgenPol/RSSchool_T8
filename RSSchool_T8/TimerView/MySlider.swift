//
//  MySlider.swift
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 18.07.2021.
//

import UIKit

protocol MySliderDelegate: AnyObject {
    func currentValueSlider(value: Float)
}



class MySlider: UISlider {
    weak var delegate: MySliderDelegate?
    override func setValue(_ value: Float, animated: Bool) {
        super.setValue(value, animated: animated)
        self.delegate?.currentValueSlider(value: value)
    }
   
    
   static func slider() -> MySlider {
    let slider = MySlider.init()
    
    slider.minimumValue = 1.00
    slider.maximumValue = 5.00
    slider.backgroundColor = UIColor.white
    slider.tintColor = UIColor.init(named: "LightGreenSea")
    
    
    return slider
    }
}

