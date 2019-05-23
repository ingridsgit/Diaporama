//
//  SettingsViewController.swift
//  Diaporama
//
//  Created by Admin on 23/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var durationStepper: UIStepper!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDurationText(duration: UserData.displayDuration)
        setStepperValue(value: UserData.displayDuration)
        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func onStepperClicked(_ sender: UIStepper) {
        UserData.displayDuration = sender.value
        setDurationText(duration: sender.value)
    }
    
    func setDurationText(duration: Double){
        var seconds = " second"
        if duration > 1 {
            seconds = " seconds"
        }
        durationLabel.text = "Display duration: \(duration.description.replacingOccurrences(of: ".0", with: seconds))"
    }
    
    func setStepperValue(value: Double){
        durationStepper.value = value
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
