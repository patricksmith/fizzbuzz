//
//  Game.swift
//  FizzBuzz
//
//  Created by Patrick Smith on 1/16/16.
//  Copyright © 2016 Patrick Smith. All rights reserved.
//

import Foundation

class Game: NSObject {
    var score: Int
    var brain: Brain
    
    override init() {
        score = 0
        brain = Brain()
        super.init()
    }
    
    func play(move: Move) -> (right: Bool, score: Int) {
        let result = brain.check(score + 1)
        
        if result == move {
            score++
            return (true, score)
        } else {
            return (false, score)
        }
    }
}