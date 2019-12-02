//
//  Challenge.swift
//  ChallengeCalculator
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct Challenge {
    //illustration testing purposes - not part of the app logic
    func addTwoNumbers(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }


//user inputs 11,000 feet elevation
//user inputs 5 weeks
func CalculateWeeklyTraining(for metric: Double, and weeks: Int) -> Int {
    
    //refactor to guard against 0 weeks
    //red(fails test), green(passes test), refactoring (rewrite, optimize)
    guard weeks > 0 else {
        return -1
    }
    
    
    return Int(metric) / weeks //return average metric (elevation, distance) per week
}
    //production code ships with the application = part of the logic for application
    func averageTrainingPerWeek(challengeMetric: Int, numberOfWorkoutDays: Int) -> Int {
        
        //guard against zero, letter
        //refactor to guard for valid days of the week 1...7
        guard (1...7).contains(numberOfWorkoutDays) else {
            return -1
        }
        
        return challengeMetric / numberOfWorkoutDays
    }
    
}
