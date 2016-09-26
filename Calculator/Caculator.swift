//
//  Caculator.swift
//  Calculator
//
//  Created by Chun Cao on 2016/9/26.
//  Copyright © 2016年 idup. All rights reserved.
//

import Foundation

func add(op1: Double, op2: Double) -> Double{
    return op1+op2
}

class Calculator: NSObject {
    
    enum Operation {
        case UnaryOp
        case BinaryOp((Double, Double) -> Double)
        case EqualsOp
    }
    
    var operations  = [
        
        "+": Operation.BinaryOp({(op1, op2) in
            return op1+op2
        }),
        
        "−": Operation.BinaryOp({(op1: Double, op2: Double) -> Double in
            return op1-op2
        }),
        
        "×": Operation.BinaryOp({ $0 * $1 }),
        
        "÷": Operation.BinaryOp({ $0 / $1 }),
        
        "=": Operation.EqualsOp
    ]
    
    
    func performOperation(operation: String, operand: Double){
        
        if let op = operations[operation]{
            switch  op {
            case .BinaryOp(let function):
                pendingOp = Intermediate(firstOp: operand, waitingOperation: function)
                result = operand
            case .UnaryOp:
                break
            case .EqualsOp:
                if let theOperation =  pendingOp{
                    result = theOperation.waitingOperation(theOperation.firstOp, operand)
                }
                
            }
        }
    }
    
    var result = 0.0
    
    var pendingOp: Intermediate? = nil
    
    
    struct Intermediate{
        var firstOp: Double
        var waitingOperation : (Double, Double) ->Double
    }
    
    
    
}
