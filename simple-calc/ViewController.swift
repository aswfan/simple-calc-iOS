//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/14/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    private var history_: [String] = []
    private var operation: String = ""
    private var op: String = ""
    
    var history: [String] {
        get {
            return self.history_
        }
    }
    
    var value: Int = 0
    var val = 0
    
    var avg = false
    var avgNum = 0
    
    var cnt = false
    var cntNum = 0
    
    var changeOperator = false
    var fun: ((Int, Int) -> (Bool, Int))? = nil
    
    var isSelectNumBtn = true
    
    var hlBtn: RoundButton? = nil
    
    @IBOutlet weak var btn1: RoundButton!
    @IBOutlet weak var btn2: RoundButton!
    @IBOutlet weak var btn3: RoundButton!
    @IBOutlet weak var btn4: RoundButton!
    @IBOutlet weak var btn5: RoundButton!
    @IBOutlet weak var btn6: RoundButton!
    @IBOutlet weak var btn7: RoundButton!
    @IBOutlet weak var btn8: RoundButton!
    @IBOutlet weak var btn9: RoundButton!
    @IBOutlet weak var btn0: RoundButton!
    @IBOutlet weak var addBtn: RoundButton!
    @IBOutlet weak var subBtn: RoundButton!
    @IBOutlet weak var mulBtn: RoundButton!
    @IBOutlet weak var divBtn: RoundButton!
    @IBOutlet weak var modBtn: RoundButton!
    @IBOutlet weak var acBtn: RoundButton!
    @IBOutlet weak var cntBtn: RoundButton!
    @IBOutlet weak var avgBtn: RoundButton!
    @IBOutlet weak var factBtn: RoundButton!
    @IBOutlet weak var eqlBtn: RoundButton!
    
    @IBOutlet weak var resLabel: UILabel!
    
    @IBAction func historyTouchUp(_ sender: RoundButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc: HistoryViewController = sb.instantiateViewController(withIdentifier: "HistoryController") as! HistoryViewController
        
        vc.superController = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func touchDownBtn(_ sender: Any) {
        if let btn = sender as? RoundButton {
            btn.backgroundColor = UIColor.init(red: 32/255, green: 184/255, blue: 252/255, alpha: 0.5)
        }
    }
    
    @IBAction func touchUpBtn(_ sender: Any) {
        if !(sender is UIButton) {
            return
        }
        
        let mo = mathOperation()
        
        let btn = sender as! RoundButton
        
        hlbuttonStatus(btn)
        
//        var val = Int(resLabel.text!)!
        
        if btn === acBtn {
            clear()
            val = 0
            setResult(0)
        }
        else if btn === btn1 || btn === btn2 || btn === btn3 || btn === btn4 || btn === btn5 ||
            btn === btn6 || btn === btn7 || btn === btn8 || btn === btn9 || btn === btn0 {
            
            if !isSelectNumBtn {
                if operation == "" {
                    operation += String(value)
                }
                operation += " " + op + " "
            }
            
            isSelectNumBtn = true
            
            let digit = btn.titleLabel!.text!
            val = val * 10  + Int (digit)!
            setResult(val)
            
            operation += digit
        }
        else {
            
            if isSelectNumBtn {
                value = mo.operation(left: value, right: val, fun: fun)
                val = 0
            }
            
            if btn === eqlBtn || btn === factBtn {
                
                if btn === factBtn {
                    value = mo.fact(a: value)
                    
                    operation += " " + btn.titleLabel!.text! + " "
                }
                else {
                    if avg {
                        if isSelectNumBtn {
                            avgNum += 1
                        }
                        value = value/avgNum
                    }
                    
                    if cnt {
                        if isSelectNumBtn {
                            cntNum += 1
                        }
                        value = cntNum
                    }
                }
                operation += " = \(value)"
                history_.append(operation)
                
                setResult(value)
                clear()
            }
            else{
                setResult(val)
                
                op = btn.titleLabel!.text!
                
                if btn === cntBtn || btn === avgBtn {
                    fun = nil
                    
                    if btn === cntBtn {
                        cnt = true
                        if isSelectNumBtn {
                            cntNum += 1
                        }
                    }
                    else {
                        avg = true
                        if isSelectNumBtn {
                            avgNum += 1
                        }
                        
                        fun = mo.add(a:b:)
                    }
                }
                else {
                    clearNum()
                    
                    if btn === addBtn {
                        fun = mo.add(a:b:)
                    }
                    else if btn === subBtn {
                        fun = mo.sub(a:b:)
                    }
                    else if btn === mulBtn {
                        fun = mo.mul(a:b:)
                    }
                    else if btn === divBtn {
                        fun = mo.div(a:b:)
                    }
                    else if btn === modBtn {
                        fun = mo.mod(a:b:)
                    }

                }
                isSelectNumBtn = false
            }
        }
    }
    
    private func setResult(_ res: Int) {
        resLabel.text = String(res)
    }
    
    private func hlbuttonStatus(_ btn: RoundButton) {
        if btn === eqlBtn {
            hlBtn?.backgroundColor = UIColor.white
        }
        
        if !(btn === addBtn || btn === subBtn || btn === mulBtn || btn === divBtn
            || btn === modBtn || btn === cntBtn || btn === avgBtn) {
            btn.backgroundColor = UIColor.white
        }else {
            if !(btn === hlBtn) {
                hlBtn?.backgroundColor = UIColor.white
                hlBtn = btn
            }
        }
    }
    
    private func clearNum() {
        avgNum = 0
        cntNum = 0
        cnt = false
        avg = false
    }
    
    private func clear() {
        isSelectNumBtn = true
        fun = nil
        op = ""
        operation = ""
        clearNum()
        hlbuttonStatus(eqlBtn)
        
    }
    
    private func addHistory () {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

