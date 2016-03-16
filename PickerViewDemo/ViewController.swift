//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Greg Willis on 3/16/16.
//  Copyright © 2016 Willis Programming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sportTextField: UITextField!
    @IBOutlet var skillLevelTextField: UITextField!
    var pickerView: UIPickerView!
    
    var sportData = ["Skiing", "Snowboarding", "Option One", "Option Two"]
    var skillData = ["Beginner", "Intermediate", "Advanced", "Expert"]
    
    var selections = [UITextField: [String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        sportTextField.inputView = pickerView
        sportTextField.text = "Select"
        skillLevelTextField.inputView = pickerView
        skillLevelTextField.text = "Select"
        
        pickerView.removeFromSuperview()
        
        selections[sportTextField] = sportData
        selections[skillLevelTextField] = skillData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getText() -> Int {
        return pickerView.selectedRowInComponent(0)
    }
}


extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(colorPicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sportData.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if sportTextField.isFirstResponder() {
//            return sportData[row]
//        }
//        if skillLevelTextField.isFirstResponder() {
//            return skillData[row]
//        }
        
        var result: String? = nil
        
        selections.forEach { (text, data) in
            if text.isFirstResponder() {
                result = data[row]
            }
        }
        
        return result
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if sportTextField.isFirstResponder() {
//            sportTextField.text = "\(sportData[getText()])"
//            sportTextField.resignFirstResponder()
//        }
//        if skillLevelTextField.isFirstResponder() {
//            skillLevelTextField.text = "\(skillData[getText()])"
//            skillLevelTextField.resignFirstResponder()
//        }
        selections.forEach { (text, data) -> () in
            if text.isFirstResponder() {
                text.text = data[getText()]
                text.resignFirstResponder()
            }
        }
    }
}