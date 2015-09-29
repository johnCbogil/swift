//
//  main.swift
//  HigherLower
//
//  Created by John Bogil on 9/29/15.
//  Copyright © 2015 John Bogil. All rights reserved.
//

import Foundation



let answer = randomIntBetween(0, high:100)
var turn = 0

while true {
    
    print("Turn #\(turn): Please enter a number between 0 and 100")
    
    let userInput = Int(input())
    
    if let guess = userInput {
        if(guess > answer) {
            print("Lower!")
        } else if(guess < answer) {
            print("Higher!")
        } else {
            print("Correct! The answer was \(answer).")
            break
        }
    }  else  {
        print("Invalid input, must input an integer")
        continue
    }
    turn = turn + 1
}
