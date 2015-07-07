//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Julianne Knott on 6/30/15.
//  Copyright © 2015 Julianne Knott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //setup
    @IBOutlet weak var tipSelectionControler: UISegmentedControl!
    @IBOutlet weak var totalCostDisplayLabel: UILabel!
    @IBOutlet weak var tipAmountDisplayLabel: UILabel!
    @IBOutlet weak var numberOfPeopleInPartyTextField: UITextField!
    @IBOutlet weak var costOfDinnerTextField: UITextField!
    var tip = 0.0
    var totalCost = 0.0
    var numInParty = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalCostDisplayLabel.text = "total cost"
        tipAmountDisplayLabel.text = "tip amount"
    }
    //HelperMethods
    func costOfDinner() ->Double{
        if let cost = Double(costOfDinnerTextField.text!){
            if cost > 0{
                return cost
            }
        }
        return 0
        
    }
    
    func numberInParty() ->Int{
        
        if let numInParty = Int(numberOfPeopleInPartyTextField.text!){
            if numInParty > 0{
                return numInParty
            }
        }
        return 1
    }
    
    //Display Method
    func displayTipAndCost(){
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        let totalCostString = formatter.stringFromNumber(totalCost)
        let tipString = formatter.stringFromNumber(tip)
        if numberInParty() > 1{
            totalCostDisplayLabel.text = "Your share of the total is \(totalCostString!)"
            tipAmountDisplayLabel.text = "Your share of the tip is \(tipString!)"
        }
        else{
            totalCostDisplayLabel.text = "Your total is \(totalCostString!)"
            tipAmountDisplayLabel.text = "Your tip is \(tipString!)"
        }
    }
    
    //Calculation Method
    @IBAction func percentageSelected(sender: AnyObject) {
        var percentage = 0.0
        switch (tipSelectionControler.selectedSegmentIndex){
        case 0:
            percentage = 0.10
        case 1:
            percentage = 0.15
        case 2:
            percentage = 0.20
        case 3:
            percentage = 0.25
        default:
            percentage = 0
        }
        let originalPrice = costOfDinner()
        tip = originalPrice * percentage
        totalCost = (originalPrice + tip)
        let numPeeps = numberInParty()
        
        tip /= Double(numPeeps)
        
        totalCost /= Double(numPeeps)
        displayTipAndCost()
    }
    
   }

