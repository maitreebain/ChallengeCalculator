//
//  ViewController.swift
//  ChallengeCalculator
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

enum ChallengeType: Int {
    case elevation //0
    case distance //1
}


class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var metricTextField: UITextField!
    
    @IBOutlet weak var weeksTextField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var currentChallenge: ChallengeType = ChallengeType.elevation {
        didSet {
            //TODO: calculate
            
            
            calculateChallenge()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calculateChallengePressed(_ sender: UIButton) {
        calculateChallenge()
    }
    
    func calculateChallenge() {
        // get the metric and the number of days from the textfields
        guard let metric = Double(metricTextField.text ?? ""),
            let numberofWeeks = Int(weeksTextField.text ?? "")
        else {
            // TODO: best to present an alert controller to the user
            print("missing required fields")
            return
        }
        
        let challenge = Challenge()
        
        let weeklyTraining = challenge.CalculateWeeklyTraining(for: metric, and: numberofWeeks)
        
        //switch on the current selected segment in our segmented control
        switch currentChallenge {
        case .distance:
            messageLabel.text = "Weekly training: \(weeklyTraining) feet"
            //keep in mind feet and miles are hard-coded here, ideally those would be in user settings
        case .elevation:
            messageLabel.text = "Weekly training: \(weeklyTraining) miles"
            
            //switch should be in its own function
            
        }
    }
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        //update current challenge state
        
        currentChallenge = ChallengeType(rawValue: sender.selectedSegmentIndex) ?? ChallengeType.elevation
    }
    
}

