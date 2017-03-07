//
//  ViewController.swift
//  tippu
//
//  Created by Bapat, Onkar on 3/4/17.
//  Copyright © 2017 Bapat, Onkar. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentageSegment: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
       
        let defaults = UserDefaults.standard
        let defaultTip = defaults.double(forKey: "defaultTip")
        if (defaultTip == 0){
            tipPercentageSegment.removeSegment(at: 3, animated: animated)
            calculateTip2(self)
        }
        if (defaultTip != 0){
            tipPercentageSegment.removeSegment(at: 3, animated: animated)
            tipPercentageSegment.insertSegment(withTitle: "\(defaultTip)%", at: 3, animated: animated)
            tipPercentageSegment.selectedSegmentIndex=3
            calculateTip2(self)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmount.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
        print("hello Molas !!")
    }
    
    @IBAction func calculateTip2(_ sender: AnyObject) {
        print ("--------calculating tip---------")
        
        let originalBillAmount = Double (billAmount.text!) ?? 0
    
        
        let defaults = UserDefaults.standard
        let defaultTip = defaults.double(forKey: "defaultTip")
        
        var tipPercent = defaultTip;
        
        if (tipPercentageSegment.selectedSegmentIndex==0){
            tipPercent=10
        }
        if (tipPercentageSegment.selectedSegmentIndex==1){
            tipPercent=15
        }
        if (tipPercentageSegment.selectedSegmentIndex==2){
            tipPercent=20
        }
        
        
        let tipFactor = (tipPercent/100)
        let tip = originalBillAmount * tipFactor
        let total = originalBillAmount+tip;
        
        
        tipLabel.text = String(format: "$%0.2f", tip)
        totalLabel.text = String (format:"$%0.2f", total)
    }

    
}

