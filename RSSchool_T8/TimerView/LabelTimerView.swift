//
//  LabelTimerView.swift
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 18.07.2021.
//

import UIKit

class LabelTimerView: UILabel {

    static func label() -> LabelTimerView {
        let label = LabelTimerView.init()
        
        label.textColor = UIColor.black
        label.font = UIFont.init(name: "Montserrat-Regular", size: 18)
        label.textAlignment = .center
        
        return label
    }
        

}
