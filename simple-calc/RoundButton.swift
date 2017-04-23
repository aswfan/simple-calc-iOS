//
//  RoundButton.swift
//  simple-calc
//
//  Created by iGuest on 4/16/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        draw(CGRect())
    }
    

    override func draw(_ rect: CGRect) {
        // Drawing code
        
//        backgroundColor = UIColor.init(red: 1, green: 1, blue: 0.9999, alpha: 1)
//        layer.cornerRadius = layer.frame.width/2
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor.copy(alpha: 0.1)
        clipsToBounds = true
    }
    
    
    
}
