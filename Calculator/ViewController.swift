//
//  ViewController.swift
//  Calculator
//
//  Created by Jean Francois Antier on 7/16/17.
//  Copyright © 2017 Jean Francois Antier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // display: label used to display the result of touching digits
    // userIsInTheMiddleOfTyping: false at the first time
    // digitPressed: title of the digit pressed by the user
    // A FAIRE:
    // Avoir un nombre fixe de digit à afficher
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    var displayValue: Double {
        // Computed properties: It represents the value inside the label, but
        // not as a string, but as a double
        get {
            return Double(display.text!)!
        }
        set {
            // newValue use the right stuf of an equal to set display.text
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        // Button pressed
        let digitPressed = sender.currentTitle!
        print("touchDigit \(digitPressed) was called")
        
        // Label updated with the new value
        if userIsInTheMiddleOfTyping {
            let textCurrentlyIndsplay = display.text!
            display.text = textCurrentlyIndsplay + digitPressed
        } else {
            display.text = digitPressed    // New number
            if digitPressed != "0" {
                userIsInTheMiddleOfTyping = true
            }
        }
    }
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        // Perform operations (π)
        userIsInTheMiddleOfTyping = false
        if let mathSymbol = sender.currentTitle {
            switch mathSymbol {
            case "π":
               displayValue= Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
            
        }
    }
    
}
