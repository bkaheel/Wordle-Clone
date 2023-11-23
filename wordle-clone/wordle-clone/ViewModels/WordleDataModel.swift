//
//  WordleDataModel.swift
//  wordle-clone
//
//  Created by Benjamin Kaheel on 11/23/23.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    var keyColors = [String : Color]()
    init() {
        newGame()
    }
    
    func newGame() {
        populateDefaults()
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters {
            keyColors[String(char)] = .Unused
        }
    }
    
    func addToCurrentWord(_ letter: String) {
        
    }
    
    func enterWord() {
        
    }
    
    func removeLetterFromCurrentWord() {
        
    }
    
}
