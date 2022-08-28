//
//  ViewController.swift
//  codepath-prework
//
//  Created by Ero Vedar on 8/26/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var customTipStepper: UIStepper!
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var customTipPercentLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideCustomTipControls()
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        //tipAmountLabel.text = String(format: "$%.2f", bill)
        //let tip = bill * 0.18
        var tip = 0.0
        let select = tipControl.selectedSegmentIndex
        switch select{
        case 1:
            hideCustomTipControls()
            tip = bill * 0.20
            break
        case 2:
            hideCustomTipControls()
            tip = bill * 0.22
            break
        case 3:
            //customTipStepper.isHidden = false
            customTipTextField.isHidden = false
            customTipPercentLabel.isHidden = false
            
            var customTip = Double(customTipTextField.text!) ?? 0
            customTip /= 100
            
            tip = bill * customTip
            break
        default:
            hideCustomTipControls()
            tip = bill * 0.18
        }
        tipAmountLabel.text = String(format: "$%.2f", tip)
        let total = bill + tip
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func hideCustomTipControls(){
        customTipStepper.isHidden = true
        customTipTextField.isHidden = true
        customTipPercentLabel.isHidden = true
    }
}

