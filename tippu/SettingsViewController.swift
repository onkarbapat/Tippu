//
//  SettingsViewController.swift
//  tippu
//
//  Created by Bapat, Onkar on 3/5/17.
//  Copyright © 2017 Bapat, Onkar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipText: UITextField!
    @IBOutlet weak var currentDefaultTipLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let currentTip = defaults.double(forKey: "defaultTip")
        currentDefaultTipLabel.text="\(currentTip)%"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultTip = Double(defaultTipText.text!) ?? 0
        print("Saving default tip \(defaultTip)")
        defaults.set(defaultTip, forKey: "defaultTip")
        currentDefaultTipLabel.text="\(defaultTip)%"
        defaults.synchronize()
        defaultTipText.endEditing(true)
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
