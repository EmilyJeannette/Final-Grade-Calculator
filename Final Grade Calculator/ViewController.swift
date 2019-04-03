//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by Emily Kirk on 10/1/18.
//  Copyright © 2018 Emily Kirk. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    var grade = 0.00
    
    @IBOutlet weak var currentGradeTextField: UITextField!
    @IBOutlet weak var finalWeightTextField: UITextField!
    @IBOutlet weak var desiredGradeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var gradeNeededLabel: UILabel!
    @IBOutlet weak var extraCreditLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var desiredGradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: backgroundView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onGradeChosen(_ sender: UISegmentedControl) {
        finalWeightTextField.resignFirstResponder()
        currentGradeTextField.resignFirstResponder()
        
        let operation = sender.titleForSegment(at: sender.selectedSegmentIndex)
        switch operation
        {
        case "A":
            grade = 90
        case "B":
            grade = 80
        case "C":
            grade = 70
        default:
            grade = 60
        }
        
        if let currentGrade = Double(currentGradeTextField.text!){
            let desiredGrade = Double(grade)
            if let weight = Double(finalWeightTextField.text!) {
                let gradeNeeded = (100 * desiredGrade - (100 - weight) * currentGrade) / weight
                
                if gradeNeeded > 100 {
                    backgroundView.backgroundColor = UIColor.red
                    view.backgroundColor = .red
                }
                else {
                    
                    backgroundView.backgroundColor = UIColor.green
                    view.backgroundColor = .green
                }
                gradeNeededLabel.text = String(format:"%.1f", gradeNeeded) + "%"
            }
        }
    }
}

