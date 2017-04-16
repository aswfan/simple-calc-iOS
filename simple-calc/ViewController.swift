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

    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var mulBtn: UIButton!
    @IBOutlet weak var didBtn: UIButton!
    @IBOutlet weak var modBtn: UIButton!
    @IBOutlet weak var pntBtn: UIButton!
    @IBOutlet weak var cntBtn: UIButton!
    @IBOutlet weak var avgBtn: UIButton!
    @IBOutlet weak var FactBtn: UIButton!
    @IBOutlet weak var eqlBtn: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        roundButton(btn: button1)
        
    }
    
    private func roundButton(btn: UIButton) {
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = btn.layer.frame.width/2
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

