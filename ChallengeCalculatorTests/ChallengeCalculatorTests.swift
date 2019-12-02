//
//  ChallengeCalculatorTests.swift
//  ChallengeCalculatorTests
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import XCTest

//@testable is a compiler directive, enables this test suite to have
//access to the ChallengeCalculator modules
@testable import ChallengeCalculator

class ChallengeCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        print("setUp - before each test is run")
    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        print("tearDown - after each test is completed")
    }
    
    
    //test prefix is needed for compiler to understand it's a test function
    //test function does not take any parameters
    //test function does not return any values
    func testAddTwoNumbers() {
        
        //arrange your test in the following format
        
        //Three A's = arrange, act, assert
        
        //arrange(given) - setup constants, variable and the system under test
        let sut = Challenge()
        let num1 = 10
        let num2 = 5
        let expectedResult = 15
        
        //act(when) - perform workload
        let result = sut.addTwoNumbers(num1: num1, num2: num2)
        
        //assert(then) - test for given condition
        XCTAssertEqual(expectedResult, result, "\(result) ahould be \(expectedResult)")
        
    }
    
//    func testCalculateWeeklyTraining() {
//        //arrange
//        let sut = Challenge() //creating an instance of Challenge
//        let sutExpectedAverage = 2320 //feet elevation per week
//        let metric = 11_602 //overall elevation feet
//        let numberOfWeeksForChallenge = 5 //weeks
//
//        //act
//        let weeklyTraining = sut.CalculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenge)
//
//
//        //assert
//        XCTAssertEqual(sutExpectedAverage, weeklyTraining, "\(weeklyTraining) should be equal to the \(sutExpectedAverage)")
//    }
    
    //write a test to validate that entering 0 is handled returns -1
    
    
    func testCalculateWeeklyTraining() {
        let sut = Challenge()
        let sutExpectedResult = -1
        let metric = 11_602
        let numberOfWeeksForChallenge = 0
        
        let weeklyTraining = sut.CalculateWeeklyTraining(for: Double(metric), and: numberOfWeeksForChallenge)
        
        XCTAssertEqual(weeklyTraining, sutExpectedResult, "\(weeklyTraining) should be \(sutExpectedResult)")
    }
    
    //TDO: - Test Driven developmemt:
    
    /*
     1. You start off writing a unit test until it fails(or a compiler error), then go to production code e.g Challenge.swift
      2. fix the failure until the test passes, continue writing unit test until failure again and continue the cycle
     */
    
    func testAverageDailyMetric() {
        //arrange
        let sut = Challenge()
        let sutWeeklyTotalMetric = 2320 //total elevation
        let expectedDailyAverage = 773 //elevation per day
        let numberOfWorkoutDays = 3 //days
        
        //act
        let averageDailyTraining = sut.averageTrainingPerWeek(challengeMetric: sutWeeklyTotalMetric, numberOfWorkoutDays: numberOfWorkoutDays)
        
        //assert
        XCTAssertEqual(averageDailyTraining, expectedDailyAverage, "\(averageDailyTraining) should be equal to \(expectedDailyAverage)")
        
    }

}
