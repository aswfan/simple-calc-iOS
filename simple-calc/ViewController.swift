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
    
    var history: [String] {
        get {
            return self.history
        }
    }
    
    var value: Int = 0
    var count = 0
    var input = false
    var avg = false
    var cnt = false
    var fun: ((Int, Int) -> (Bool, Int))? = nil
    
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
        
        var val = Int(resLabel.text!)!
        
        if btn === cntBtn || btn === avgBtn {
            if btn == cntBtn {
                cnt = true
            }else {
                avg = true
            }
            count += 1
        }
        
        switch btn {
        case avgBtn, addBtn:
            value = mo.operation(left: value, right: val, fun: fun)
            fun = mo.add
        case subBtn:
            value = mo.operation(left: value, right: val, fun: fun)
            fun = mo.sub
        case mulBtn:
            value = mo.operation(left: value, right: val, fun: fun)
            fun = mo.mul
        case divBtn:
            value = mo.operation(left: value, right: val, fun: fun)
            fun = mo.div
        case modBtn:
            value = mo.operation(left: value, right: val, fun: fun)
            fun = mo.mod
        case cntBtn:
            value = val
        case factBtn:
            value = mo.operation(left: value, right: val, fun: fun)
            value = mo.fact(a: value)
        case eqlBtn:
            if avg || cnt {
                count += 1
            }
            value = mo.operation(left: value, right: val, fun: fun)
        case acBtn:
            val = 0
            value = 0
            clear()
        default:
            if input {
                val = 0
            }
            val = val * 10 + Int((btn.titleLabel?.text)!)!
        }
        
        if btn === factBtn {
            resLabel.text = String(value)
        }else if btn === eqlBtn {
            if avg || cnt{
                if avg {
                    resLabel.text = String(value/Int(count))
                    avg = !avg
                }else {
                    resLabel.text = String(count)
                    cnt = !cnt
                }
                count = 0
            }else {
                resLabel.text = String(value)
            }
            
            clear()
            
        }else {
            resLabel.text = String(val)
        }
        
        if btn === btn0 || btn === btn1 || btn === btn2 || btn === btn3 ||
            btn === btn4 || btn === btn5 || btn === btn6 || btn === btn7 ||
            btn === btn8 || btn === btn9 {
            input = false
        }else {
            input = true
        }
        
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
    
    private func clear() {
        count = 0
        input = false
        cnt = false
        avg = false
        fun = nil
        
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

