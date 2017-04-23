//
//  mathOperation.swift
//  simple-calc
//
//  Created by iGuest on 4/22/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import UIKit

class mathOperation: NSObject {

    public func operation(left a: Int, right b: Int, fun: ((Int, Int) -> (Bool, Int))?) -> Int {
        if let f = fun {
            return f(a, b).1
        }else {
            return b
        }
    }
    
    public func add(a: Int, b: Int) -> (Bool, Int) {
        return (true, a + b)
    }
    
    public func sub(a: Int, b: Int) -> (Bool, Int) {
        return (true, a - b)
    }
    
    public func mul(a: Int, b: Int) -> (Bool, Int) {
        return (true, a * b)
    }
    
    public func div(a: Int, b: Int) -> (Bool, Int) {
        if b == 0 {
            print("Illegal input: Int division or modulo by zero")
            return (false, 0)
        }
        return (true, a / b)
    }
    
    public func mod(a: Int, b: Int) -> (Bool, Int) {
        if b == 0 {
            print("Illegal input: Int division or modulo by zero")
            return (false, 0)
        }
        return (true, a % b)
    }
    
    public func fact(a: Int) -> Int {
        if a < 1 {
            return 0
        }
        var result: Int = 1
        for i in 1...a {
            if !Int.multiplyWithOverflow(result, i).1 {
                result *= i
            }else {
                result = 0
                print("Error: Integer Overflow!")
                break;
            }
            
        }
        return result
    }

}
