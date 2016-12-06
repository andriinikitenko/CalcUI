//
//  ViewController.swift
//  CalcGui
//
//  Created by Andrii Nikitenko on 04.12.16.
//  Copyright © 2016 Andrii Nikitenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSing = ""
    
    
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
    }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            
            if valueArray[1] == "0" {
                self.displayResultLabel.text = "\(valueArray[0])"
            }else {
                displayResultLabel.text = "\(newValue)"
             }
           
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        if stillTyping {
            if displayResultLabel.text!.characters.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }

        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
        
}

    @IBAction func twoOperandSingPressed(_ sender: UIButton) {
        operationSing = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    @IBAction func equalitySingPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlaced = false
        
        switch operationSing{
            case "+":
                operateWithTwoOperands{$0 + $1}
            case "-":
                operateWithTwoOperands{$0 - $1}
            case "✕":
                operateWithTwoOperands{$0 * $1}
            case "÷":
                operateWithTwoOperands{$0 / $1}
        default: break
        }
    }

    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSing = ""
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        if displayResultLabel.text == "0" {
            currentInput = +currentInput
        }else {
            currentInput = -currentInput
        }
}
    
    @IBAction func precantageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
        currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100

        }
    }
    @IBAction func sqareRootButtonPressed(_ sender: UIButton) {
        currentInput = sqrt(currentInput)
    }

    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0."
        }
    }
    
}

        
        //    @IBAction func ButtonsqareRootButtonPressed(_ sender: UIButton) {
//        
//        currentInput = sqrt(currentInput)
//    }
//    
//    @IBAction func dotButtonPressed(_ sender: UIButton) {
//    }
    


