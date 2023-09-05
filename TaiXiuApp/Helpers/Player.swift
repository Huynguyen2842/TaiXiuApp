//
//  PlayersData.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import Foundation
struct Player: Codable {
    var id: Int
    var username: String
    var password: String
    var HighScore: Int
    var UserMoney: Int
    var BattleNum: Int
    var WinPercentage: Float
    var achievements: [Achievement]
    var isBetAnyTriple: Bool = false
    var isBetOdd: Bool = false
    var isBetEven: Bool = false
    var isBetSmall: Bool = false
    var isBetBig: Bool = false
    var isBetDoubleOne: Bool = false
    var isBetDoubleTwo: Bool = false
    var isBetDoubleThree: Bool = false
    var isBetDoubleFour: Bool = false
    var isBetDoubleFive: Bool = false
    var isBetDoubleSix: Bool = false
    var isBetOne: Bool = false
    var isBetTwo: Bool = false
    var isBetThree: Bool = false
    var isBetFour: Bool = false
    var isBetFive: Bool = false
    var isBetSix: Bool = false
    var isBetOneTwo: Bool = false
    var isBetOneThree: Bool = false
    var isBetOneFour: Bool = false
    var isBetOneFive: Bool = false
    var isBetOneSix: Bool = false
    var isBetTwoThree: Bool = false
    var isBetTwoFour: Bool = false
    var isBetTwoFive: Bool = false
    var isBetTwoSix: Bool = false
    var isBetThreeFour: Bool = false
    var isBetThreeFive: Bool = false
    var isBetThreeSix: Bool = false
    var isBetFourFive: Bool = false
    var isBetFourSix: Bool = false
    var isBetFiveSix: Bool = false
}
