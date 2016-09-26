//
//  ViewController.swift
//  Calculator
//
//  Created by Chun Cao on 2016/9/26.
//  Copyright © 2016年 idup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var calculator = Calculator()
    
    @IBOutlet weak var display: UILabel!
    
    var inTypingMiddle = false
    
    @IBAction func numberTouched(_ sender: UIButton) {
        
        if let currentDigit = sender.currentTitle {
            if inTypingMiddle{
                digitOnDisplay = digitOnDisplay + currentDigit
            }
            else{
                digitOnDisplay = currentDigit
                inTypingMiddle = true
            }
        }
    }
    
    var digitOnDisplay: String{
        get{
            return self.display.text!
        }
        set{
            self.display.text = newValue
        }
    }
    
    
    @IBAction func operatorTouched(_ sender: UIButton) {
        
        if let op = sender.currentTitle {
            
            
            calculator.performOperation(operation: op, operand: Double(digitOnDisplay)!)
            digitOnDisplay = String(calculator.result)
            
            inTypingMiddle = false
        }
        
        
    }
}

