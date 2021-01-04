//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Harry Chuang on 1/3/21.
//  Copyright © 2021 Harry Chuang. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            default:
                return nil
            }
        }
        return nil
    }
}
