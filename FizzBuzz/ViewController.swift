//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Patrick Smith on 1/16/16.
//  Copyright © 2016 Patrick Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gameScore: Int? {
        didSet {
            guard let score = gameScore else {
                print("gameScore is nil")
                return
            }
            numberButton.setTitle("\(score)", forState: .Normal)
        }
    }
    
    var game: Game?
    
    var wrongColor: UIColor = UIColor(red: 0xA2 / 255.0, green: 0x12 / 255.0, blue: 0x32 / 255.0, alpha: 1)
    var rightColor: UIColor = UIColor(red: 0x20 / 255.0, green: 0x61 / 255.0, blue: 0x5B / 255.0, alpha: 1)
    
    @IBOutlet weak var numberButton: UIButton!
    
    @IBOutlet weak var fizzButton: UIButton!
    
    @IBOutlet weak var buzzButton: UIButton!
    
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    @IBOutlet var background: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game()
        guard let unwrappedGame = game else {
            print("Game is nil")
            return
        }
        gameScore = unwrappedGame.score
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func play(move: Move) {
        guard let unwrappedGame = game else {
            print("Game is nil!")
            return
        }
        let response = unwrappedGame.play(move)
        gameScore = response.score
        if response.right {
            background.backgroundColor = rightColor
        } else {
            background.backgroundColor = wrongColor
        }
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        switch sender {
        case numberButton:
            play(Move.Number)
        case fizzButton:
            play(Move.Fizz)
        case buzzButton:
            play(Move.Buzz)
        case fizzBuzzButton:
            play(Move.FizzBuzz)
        default:
            print("Invalid selection")
        }
    }
}

