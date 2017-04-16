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
    @IBOutlet weak var didBtn: RoundButton!
    @IBOutlet weak var modBtn: RoundButton!
    @IBOutlet weak var pntBtn: RoundButton!
    @IBOutlet weak var cntBtn: RoundButton!
    @IBOutlet weak var avgBtn: RoundButton!
    @IBOutlet weak var FactBtn: RoundButton!
    @IBOutlet weak var eqlBtn: RoundButton!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

