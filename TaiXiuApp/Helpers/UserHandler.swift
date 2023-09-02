//
//  UserHandler.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import Foundation

final class UserHandler: ObservableObject{
    @Published var isBetOdd: Bool = false
    @Published var isBetEven = false
    @Published var isBetSmall = false
    @Published var isBetBig = false
    @Published var isBetAnyTriple = false
    @Published var isBetDoubleOne = false
    @Published var isBetDoubleTwo = false
    @Published var isBetDoubleThree = false
    @Published var isBetDoubleFour = false
    @Published var isBetDoubleFive = false
    @Published var isBetDoubleSix = false
    @Published var isBetOne = false
    @Published var isBetTwo = false
    @Published var isBetThree = false
    @Published var isBetFour = false
    @Published var isBetFive = false
    @Published var isBetSix = false
    @Published var isBetOneTwo = false
    @Published var isBetOneThree = false
    @Published var isBetOneFour = false
    @Published var isBetOneFive = false
    @Published var isBetOneSix = false
    @Published var isBetTwoThree = false
    @Published var isBetTwoFour = false
    @Published var isBetTwoFive = false
    @Published var isBetTwoSix = false
    @Published var isBetThreeFour = false
    @Published var isBetThreeFive = false
    @Published var isBetThreeSix = false
    @Published var isBetFourFive = false
    @Published var isBetFourSix = false
    @Published var isBetFiveSix = false
    
    // MARK: - BET SMALL LOGIC
    func chooseBetSmall() {
        isBetSmall.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET BIG LOGIC
    func chooseBetBig() {
        isBetBig.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET ODD LOGIC
    func chooseBetOdd() {

        isBetOdd.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET EVEN LOGIC
    func chooseBetEven() {
        isBetEven.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Any Triple LOGIC
    func chooseBetAnyTriple() {
        isBetAnyTriple.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Double One LOGIC
    func chooseBetDoubleOne() {
        
        isBetDoubleOne.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Double Two LOGIC
    func chooseBetDoubleTwo() {
        
        isBetDoubleTwo.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Double Three LOGIC
    func chooseBetDoubleThree() {
        
        isBetDoubleThree.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Double Four LOGIC
    func chooseBetDoubleFour() {
        
        isBetDoubleFour.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Double Five LOGIC
    func chooseBetDoubleFive() {
        
        isBetDoubleFive.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Double Six LOGIC
    func chooseBetDoubleSix() {
        
        isBetDoubleSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET One LOGIC
    func chooseBetOne() {
        
        isBetOne.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Two LOGIC
    func chooseBetTwo() {
        
        isBetTwo.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Three LOGIC
    func chooseBetThree() {
        
        isBetThree.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Four LOGIC
    func chooseBetFour() {
        
        isBetFour.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Five LOGIC
    func chooseBetFive() {
        isBetFive.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Three LOGIC
    func chooseBetSix() {
        isBetSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET One Two LOGIC
    func chooseBetOneTwo() {
        
        isBetOneTwo.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET One Three LOGIC
    func chooseBetOneThree() {
        
        isBetOneThree.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET One Four LOGIC
    func chooseBetOneFour() {
        
        isBetOneFour.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET One Five LOGIC
    func chooseBetOneFive() {
        
        isBetOneFive.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET One Six LOGIC
    func chooseBetOneSix() {
        
        isBetOneSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Two Three LOGIC
    func chooseBetTwoThree() {
        
        isBetTwoThree.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Two Four LOGIC
    func chooseBetTwoFour() {
        
        isBetTwoFour.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Two Five LOGIC
    func chooseBetTwoFive() {
        
        isBetTwoFive.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Two Six LOGIC
    func chooseBetTwoSix() {
        
        isBetTwoSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Three Four LOGIC
    func chooseBetThreeFour() {
        
        isBetThreeFour.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Three Five LOGIC
    func chooseBetThreeFive() {
        
        isBetThreeFive.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Three SixLOGIC
    func chooseBetThreeSix() {
        
        isBetThreeSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Four Five LOGIC
    func chooseBetFourFive() {
        
        isBetFourFive.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Four Six LOGIC
    func chooseBetFourSix() {
        
        isBetFourSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Five Six LOGIC
    func chooseBetFiveSix() {
        
        isBetFiveSix.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
}
