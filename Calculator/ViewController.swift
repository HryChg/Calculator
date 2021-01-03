//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a double")
        }
        
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayLabel.text = String(number / 100.0)
            
            default:
                fatalError("Calculation method not found")
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    guard let numValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a double")
                    }
                    let isInt = floor(numValue) == numValue
                    if !isInt { // contains decimal point
                        return // do not append the "." if it already is a double number
                    }
                }
                
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

