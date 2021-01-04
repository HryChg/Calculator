//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculator = CalculatorLogic()
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        set {
            displayLabel.text = toString(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        if let calcMethod = sender.currentTitle {
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let numStr = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numStr
                isFinishedTypingNumber = false
            } else {
                if numStr == "." {
                    if !isInt(displayValue) {
                        return // do not append the "." if it already contains decimal point
                    }
                }
                displayLabel.text = displayLabel.text! + numStr
            }
        }
    }
    
    private func isInt (_ num: Double) -> Bool {
        return floor(num) == num
    }
    
    private func toString (_ num: Double) -> String {
        if isInt(num) {
            return String(Int(num))
        }
        return String(num)
    }
}

