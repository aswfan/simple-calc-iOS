//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by iGuest on 4/23/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var superController: ViewController?

    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func backBtnOnClick(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let records: [String]? = superController?.history
        if records != nil {
            for record in records! {
                let label = UILabel()
                label.text = record
                stackView.addArrangedSubview(label)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
