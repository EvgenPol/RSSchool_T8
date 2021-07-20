//
//  TimerView.swift
//  RSSchool_T8
//
//  Created by Евгений Полюбин on 18.07.2021.
//

import UIKit

@objc public protocol TimerViewDelegate {
   @objc func saveTouchTime()
}

class TimerView: UIInputView {
    private weak var curentValueLabel: UILabel?
    private weak var layerTimerView: CALayer?
    
    @objc public weak var delegate: TimerViewDelegate?
    @objc public var selectedValue: Float = 1.00
    
    private func setupTimerView() {
        self.setupLayers()
        self.setupSlider()
        self.setupSaveButton()
    }
    
     init() {
        let screenSize = UIScreen.main.bounds.size;
        let frame = CGRect.init(x: 0, y: 0, width: screenSize.width, height: screenSize.height/2)
        super.init(frame: frame, inputViewStyle: .default)
        self.setupTimerView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


//MARK: setting up the TimerView view
extension TimerView {
    private func setupLayers() {
        let basicLayer = CALayer.init()
        let frame = self.layer.frame
        let width = UIScreen.main.bounds.size.width
        
        self.layer.backgroundColor = UIColor.white.cgColor
        basicLayer.frame = CGRect(x: frame.origin.x, y: frame.origin.x, width: width, height: frame.size.height)
        basicLayer.backgroundColor = UIColor.white.cgColor
        basicLayer.cornerRadius = 40
        basicLayer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        self.layerTimerView = basicLayer
        
        self.addShadow(layer: basicLayer)
        self.layer.addSublayer(basicLayer)
    }
    
    private func addShadow(layer: CALayer ) {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1.0;
        layer.shadowRadius = 8.0;
    }
    
    private func setupSlider() {
        let slider = MySlider.slider()
        let minValueLabel = LabelTimerView.label()
        let curentValueLabel = LabelTimerView.label()
        let maxValueLabel = LabelTimerView.label()
        
        slider.delegate = self
        minValueLabel.text = "1"
        maxValueLabel.text = "5"
        curentValueLabel.text = "1.00 s"
       
        self.addSubview(slider)
        self.addSubview(minValueLabel)
        self.addSubview(maxValueLabel)
        self.addSubview(curentValueLabel)
        self.curentValueLabel = curentValueLabel
        
        self.addConstrains(slider, minValueLabel, maxValueLabel, curentValueLabel)
    }
    
    private func setupSaveButton() {
        let saveButton = MyButton()
        MyButton.addShadowButton(saveButton.layer)
        saveButton.setupMyButton()
        saveButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 21)
        saveButton.setTitle("Save", for: .normal)
    
        saveButton.addTarget(self.delegate,
                             action: #selector(TimerViewDelegate.saveTouchTime),
                             for: .touchUpInside)
        
        self.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo:self.topAnchor, constant:20).isActive = true;
        saveButton.rightAnchor.constraint(equalTo:self.rightAnchor, constant:-40).isActive = true;
        saveButton.widthAnchor.constraint(equalToConstant: 85).isActive = true;
    }
}



//MARK: subscribe TimerView to MySliderDelegate
extension TimerView: MySliderDelegate{
    func currentValueSlider(value: Float) {
        self.curentValueLabel?.text = String(format: "%.2f s", value)
        self.selectedValue = value
    }
}



//MARK: Add constrains for slider
extension TimerView {
    private func addConstrains(_ slider: MySlider,
                               _ minValueLabel: LabelTimerView,
                               _ maxValueLabel: LabelTimerView,
                               _ currentValueLabel: LabelTimerView) {
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: self.topAnchor, constant: 92).isActive = true
        slider.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        slider.widthAnchor.constraint(equalToConstant: 255).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        minValueLabel.translatesAutoresizingMaskIntoConstraints = false
        minValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 103).isActive = true
        minValueLabel.widthAnchor.constraint(equalToConstant: 7).isActive = true
        minValueLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        minValueLabel.rightAnchor.constraint(equalTo: slider.leftAnchor, constant: -25).isActive = true
        
        maxValueLabel.translatesAutoresizingMaskIntoConstraints = false
        maxValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 103).isActive = true
        maxValueLabel.widthAnchor.constraint(equalToConstant: 11).isActive = true
        maxValueLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        maxValueLabel.leftAnchor.constraint(equalTo: slider.rightAnchor, constant: 25).isActive = true
        
        currentValueLabel.translatesAutoresizingMaskIntoConstraints = false
        currentValueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 161).isActive = true
        currentValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentValueLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        currentValueLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
}
