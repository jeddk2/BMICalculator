//
//  ViewController.swift
//  BMICalculator
//
//  Created by jedd on 1/1/18.
//  Copyright © 2018 Jedd Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var enterYourMassLabel: UILabel!
    @IBOutlet weak var enterYourHeightLabel: UILabel!
    
    @IBOutlet weak var yourBMIResult: UILabel!
    @IBOutlet weak var yourMass: UITextField!
    @IBOutlet weak var yourHeight: UITextField!
    
    var metricUnits : Bool = false  //Default to standard units
    
    @IBAction func unitSystemSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            enterYourMassLabel.text = "Enter your mass (kg)"
            enterYourHeightLabel.text = "Enter your height (m)"
            metricUnits = true
        }
        else {
            enterYourMassLabel.text = "Enter your mass (lbs)"
            enterYourHeightLabel.text = "Enter your height (in.)"
            metricUnits = false
        }
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        yourBMIResult.text = "Your BMI is " + String(BMICalculator(metricUnits: metricUnits))
       
        /*
        if yourMass != nil {
            yourBMIResult.text = "Mass = " + (yourMass.text)!
        }
        else {
            print("yourMass = nil")
        }
         */
    }
    
    //Function takes kilograms and returns pounds.
    func kg_To_lbs(kg : Float) -> Float {
        let lbs = kg * 2.2046226218488
        return lbs
    }
    
    //Function takes pounds and returns kilograms
    func lbs_To_kg(lbs : Float) -> Float{
        let kg = lbs * 0.45359237
        return kg
    }
    
    //Function takes meters and returns inches
    func meters_To_inches(meters : Float) -> Float {
        let inches = meters * 39.37007874
        return inches
    }
    
    //Function takes inches and returns meters.
    func inches_To_meters(inches : Float) -> Float {
        let meters = inches * 0.0254
        return meters
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
     //Called when the user click on the view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func BMICalculator(metricUnits : Bool) -> Float {
        var BMI : Double = 0
        
        if metricUnits == true {
            if Float(yourMass.text!) != nil && Float(yourHeight.text!) != nil {
            //if the user is entering meters and kilograms
            let mass : Float = Float(yourMass.text!)!
            let height : Float = Float(yourHeight.text!)!
            BMI = (Double(mass))/(pow(Double(height),2.0))
            print(BMI)
            }
            else {
                print("yourMass and/or yourHeight = nil")
            }
        }
        else {
            //if the user is entering inches and pounds
            if Float(yourMass.text!) != nil && Float(yourHeight.text!) != nil {
            var mass : Float = Float(yourMass.text!)!  //entered in lbs
            var height : Float = Float(yourHeight.text!)!  //entered in inches
            mass = lbs_To_kg(lbs: mass)  //converts lbs to kilograms.
            height = inches_To_meters(inches: height) //converts inches to meters
            BMI = (Double(mass))/(pow(Double(height),2.0))
            print(BMI)
            }
            else {
                print("yourMass and/or yourHeight = nil")
            }
        }
        self.view.endEditing(true)
        return Float(BMI)
    }

    
}

