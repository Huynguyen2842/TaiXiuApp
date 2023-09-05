//
//  ContentView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players:PlayerModel = PlayerModel()
    @State var gameLevel: Int = 1
    @State var selectedLevel: Int = 1
    @State var language: String = ""
    @State var AchivementPlayerIndex: Int = -1
    // MARK: - PROPERTIES
    let icons = ["dice1","dice2","dice3","dice4","dice5","dice6"]
//    let icons = ["apple","bar","bell"]
    @EnvironmentObject var userProgress: UserHandler
    @StateObject var userHandler = UserHandler()
    @Environment(\.presentationMode) var presentationMode
    @State var BetRatios: Int = 1
    @State var Win: Int = 0
    @State var WinStreak: Int = 0
    @State var HighestStreak: Int = 0
    @State var FirstWin: Int = 0
    @State var Lose: Int = 0
    @State var win_percentage: Float = 0
    @State var Battle_Num: Int = 0
    @State var reels = [0,1,2]
    @State var coins = 300
    @State var betAmount = 10
    @State var highscore = 0
    @State var isChooseBet10 = true
    @State var isChooseBet20 = false
    @State var animationIcon = true
    @State var showGameOverMessage = false
    @State var showInfoView = false
    @State var showLeaderBoard = false
    @State var NumReel0 = 0
    @State var NumReel1 = 0
    @State var NumReel2 = 0
    @State var sum3Reel = 0
    @Binding var currentPlayerIndex: Int
    
    // MARK: -SELECT LEVEL
    func adjustGameLogicForLevel() {
        switch selectedLevel {
        case 1:
            BetRatios = 1
        case 2:
            BetRatios = 2
            // Adjust win conditions and other parameters for medium level
        case 3:
            BetRatios = 3
            // Adjust win conditions and other parameters for hard level
        default:
            BetRatios = 1
        }
        print(BetRatios)
    }
 
    // MARK: - LOGIC SPIN REELS
    func spinReels(){
//        reels[0] = Int.random(in: 0...icons.count-1)
//        reels[1] = Int.random(in: 0...icons.count-1)
//        reels[2] = Int.random(in: 0...icons.count-1)
        reels = reels.map({_ in Int.random(in: 0...icons.count-1)})
        playSound(sound: "spin", type: "mp3")
    }
    
    // MARK: - GAME LOGIC FUNCTIONS
    
    // MARK: - CHECKING WINING LOGIC
    func CheckWinning() {
        
        //MARK: - SUM OF 3 REELS LOGIC
        NumReel0 = reels[0] + 1
        NumReel1 = reels[1] + 1
        NumReel2 = reels[2] + 1
        sum3Reel = NumReel0 + NumReel1 + NumReel2
        //
//        if (isFirstWin){
//            let newAchievement1 = Achievement(name: "First Win", image: "firstwin")
//            addAchievementToPlayer(player: &players.players[currentPlayerIndex], achievement: newAchievement1)
//        }
        
        //MARK: - CHECK IF USER CHOOSES ANY TRIPLE
        if (userHandler.isBetAnyTriple == true){
            if currentPlayerIndex != -1 {
                players.players[currentPlayerIndex].isBetAnyTriple = userHandler.isBetAnyTriple
            }
            if (NumReel0 == NumReel1 && NumReel1 == NumReel2 && NumReel2 == NumReel0){
                //WINING LOGIC
                PlayerWinTriple()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                //LOSING LOGIC
                PlayerLoses()
            }
            // newAchievement = Achievement (name, image)
            // .achivements.append(newAchievement)
            //
            if currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count {
                let newAchievement = Achievement(name: "Win Triple", image: "champion")
                addAchievementToPlayer(player: &players.players[currentPlayerIndex], achievement: newAchievement)
            }
        } else {
            if currentPlayerIndex != -1 {
                players.players[currentPlayerIndex].isBetAnyTriple = false
            }
        }
        
        //MARK: - CHECK IF USER CHOOSES SMALL
        if (userHandler.isBetSmall == true) {
            if (sum3Reel >= 4 && sum3Reel <= 10){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
    
        
        //MARK: - CHECK IF USER CHOOSES BIG
        if (userHandler.isBetBig == true) {
            if (sum3Reel >= 11 && sum3Reel <= 17){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        //MARK: - CHECK IF USER CHOOSES EVEN
        if (userHandler.isBetEven == true) {
            if (sum3Reel % 2 == 0) {
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER CHOOSES ODD
        if (userHandler.isBetOdd == true) {
            if (sum3Reel % 2 != 0){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS ONE
        if (userHandler.isBetOne == true) {
            if (NumReel0 == 1 || NumReel1 == 1 || NumReel2 == 1){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS TWO
        if (userHandler.isBetTwo == true) {
            if (NumReel0 == 2 || NumReel1 == 2 || NumReel2 == 2){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS THREE
        if (userHandler.isBetThree == true) {
            if (NumReel0 == 3 || NumReel1 == 3 || NumReel2 == 3){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS FOUR
        if (userHandler.isBetFour == true) {
            if (NumReel0 == 4 || NumReel1 == 4 || NumReel2 == 4){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS FIVE
        if (userHandler.isBetFive == true) {
            if (NumReel0 == 5 || NumReel1 == 5 || NumReel2 == 5){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS SIX
        if (userHandler.isBetSix == true) {
            if (NumReel0 == 6 || NumReel1 == 6 || NumReel2 == 6){
                PlayerWins()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS DOUBLE ONE
        if (userHandler.isBetDoubleOne == true) {
            if ((NumReel0 == 1 && NumReel1 == 1) || (NumReel0 == 1 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 1)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS DOUBLE TWO
        if (userHandler.isBetDoubleTwo == true) {
            if ((NumReel0 == 2 && NumReel1 == 2) || (NumReel0 == 2 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 2)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS DOUBLE THREE
        if (userHandler.isBetDoubleThree == true) {
            if ((NumReel0 == 3 && NumReel1 == 3) || (NumReel0 == 3 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 3)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS DOUBLE FOUR
        if (userHandler.isBetDoubleFour == true) {
            if ((NumReel0 == 4 && NumReel1 == 4) || (NumReel0 == 4 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 4)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS DOUBLE FIVE
        if (userHandler.isBetDoubleFive == true) {
            if ((NumReel0 == 5 && NumReel1 == 5) || (NumReel0 == 5 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 5)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS DOUBLE SIX
        if (userHandler.isBetDoubleSix == true) {
            if ((NumReel0 == 6 && NumReel1 == 6) || (NumReel0 == 6 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 6)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS ONE TWO
        if (userHandler.isBetOneTwo == true) {
            if ((NumReel0 == 1 && NumReel1 == 2) || (NumReel0 == 2 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 2) || (NumReel0 == 2 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 1)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS ONE THREE
        if (userHandler.isBetOneThree == true) {
            if ((NumReel0 == 1 && NumReel1 == 3) || (NumReel0 == 3 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 3) || (NumReel0 == 3 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 1)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS ONE FOUR
        if (userHandler.isBetOneFour == true) {
            if ((NumReel0 == 1 && NumReel1 == 4) || (NumReel0 == 4 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 4) || (NumReel0 == 4 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 1)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS ONE FIVE
        if (userHandler.isBetOneFive == true) {
            if ((NumReel0 == 1 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 1)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS ONE SIX
        if (userHandler.isBetOneSix == true) {
            if ((NumReel0 == 1 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 1)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS TWO THREE
        if (userHandler.isBetTwoThree == true) {
            if ((NumReel0 == 2 && NumReel1 == 3) || (NumReel0 == 3 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 3) || (NumReel0 == 3 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 2)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS TWO FOUR
        if (userHandler.isBetTwoFour == true) {
            if ((NumReel0 == 2 && NumReel1 == 4) || (NumReel0 == 4 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 4) || (NumReel0 == 4 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 2)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS TWO FIVE
        if (userHandler.isBetTwoFive == true) {
            if ((NumReel0 == 2 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 2)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS TWO SIX
        if (userHandler.isBetTwoSix == true) {
            if ((NumReel0 == 2 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 2)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS THREE FOUR
        if (userHandler.isBetThreeFour == true) {
            if ((NumReel0 == 3 && NumReel1 == 4) || (NumReel0 == 4 && NumReel1 == 3)
                || (NumReel0 == 3 && NumReel2 == 4) || (NumReel0 == 4 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 3)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS THREE FIVE
        if (userHandler.isBetThreeFive == true) {
            if ((NumReel0 == 3 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 3)
                || (NumReel0 == 3 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 3)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS THREE SIX
        if (userHandler.isBetThreeSix == true) {
            if ((NumReel0 == 3 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 3)
                || (NumReel0 == 3 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 3)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS FOUR FIVE
        if (userHandler.isBetFourFive == true) {
            if ((NumReel0 == 4 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 4)
                || (NumReel0 == 4 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 4)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS FOUR SIX
        if (userHandler.isBetFourSix == true) {
            if ((NumReel0 == 4 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 4)
                || (NumReel0 == 4 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 4)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
        
        //MARK: - CHECK IF USER BETS FIVE SIX
        if (userHandler.isBetFiveSix == true) {
            if ((NumReel0 == 5 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 5)
                || (NumReel0 == 5 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 5)){
                PlayerWinDouble()
                if coins > highscore {
                    newHighScore()
                } else {
                    playSound(sound: "winning", type: "mp3")
                }
            } else {
                PlayerLoses()
            }
        }
    }
    
    func getWinningStreak(){
        if (HighestStreak >= 3)
        {
            let newAchievement = Achievement(name: "Got 3 winning streak", image: "lucky")
            addAchievementToPlayer(player: &players.players[currentPlayerIndex], achievement: newAchievement)
        }
    }
    
    func getHighScoreBadge(){
        if (highscore == 400){
            if currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count {
                let newAchievement = Achievement(name: "Reach 400 coins", image: "Money")
                addAchievementToPlayer(player: &players.players[currentPlayerIndex], achievement: newAchievement)
            }
        }
    }
    
    func addAchievementToPlayer(player: inout Player, achievement: Achievement) {
        // Check if the player's achievements array already contains an achievement with the given name
        if !player.achievements.contains(where: { $0.name == achievement.name }) {
            // If it doesn't contain the achievement, then add it
            player.achievements.append(achievement)
        } else {
            print("Achievement \(achievement.name) already exists for player \(player.username). Not adding again.")
        }
    }
    func CheckFirstWin(){
        if (FirstWin == 1){
            let newAchievement1 = Achievement(name: "First Win", image: "firstwin")
          addAchievementToPlayer(player: &players.players[currentPlayerIndex], achievement: newAchievement1)
        }
    }
    
    // MARK: - PLAYER WINING LOGIC
    func PlayerWins(){
        WinStreak += 1
        FirstWin += 1
        Win += 1
        if WinStreak > HighestStreak {
            HighestStreak = WinStreak
        }
        coins += betAmount
//        players.players[currentPlayerIndex].UserMoney = coins
    }
    
    
    // MARK: - PLAYER WINING DOUBLE LOGIC
    func PlayerWinDouble(){
        WinStreak += 1
        FirstWin += 1
        Win += 1
        if WinStreak > HighestStreak {
            HighestStreak = WinStreak
        }
        coins += betAmount*3
//        players.players[currentPlayerIndex].UserMoney = coins
    }
//
    // MARK: - PLAYER WINING TRIPLE LOGIC
    func PlayerWinTriple(){
        WinStreak += 1
        FirstWin += 1
        Win += 1
        if WinStreak > HighestStreak {
            HighestStreak = WinStreak
        }
        coins += betAmount*10
//        players.players[currentPlayerIndex].UserMoney = coins
    }
    
    // MARK: - HIGHSCCORE LOGIC
    func newHighScore(){
        highscore = coins
//        players.players[currentPlayerIndex].HighScore = highscore
        playSound(sound: "highscore", type: "mp3")
    }
    // MARK: - PLAYER LOSING LOGIC
    func PlayerLoses(){
        WinStreak = 0
        Lose += 1
        coins -= betAmount*BetRatios
    }
    // MARK: - BET 20 LOGIC
    func ChooseBet20 (){
        betAmount = 20
        isChooseBet20 = true
        isChooseBet10 = false
        playSound(sound: "bet-chip", type: "mp3")
    }
    // MARK: - BET 10 LOGIC
    func ChooseBet10 (){
        betAmount = 10
        isChooseBet10 = true
        isChooseBet20 = false
        playSound(sound: "bet-chip", type: "mp3")
    }
    // MARK: - GAMEOVER LOGIC
    func isGameOver(){
        if (coins <= 0){
            coins = 0
            showGameOverMessage = true
            Battle_Num += 1
            playSound(sound: "gameover", type: "mp3")
        }
    }
    // MARK: - RESET GAME LOGIC
    func resetGame(){
        win_percentage = 0
        Battle_Num = 0
        highscore = 0
        coins = 300
        ChooseBet10()
        playSound(sound: "ring-up", type: "mp3")
    }

    
    var body: some View {
        NavigationStack {
            ZStack{
                // MARK: - BACKGROUND
                
    //            LinearGradient(gradient: Gradient(colors: [Color("RmitRed"),Color("RmitPurple")]), startPoint:.top, endPoint: .bottom)
                Color("Green")
                    .edgesIgnoringSafeArea(.all)
                
                // MARK: - GAME UI
                VStack{
                    HStack{
                        Button {
                            self.resetGame()
                            if currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count {
                                players.players[currentPlayerIndex].UserMoney = coins
                                players.players[currentPlayerIndex].HighScore = highscore
                                players.players[currentPlayerIndex].WinPercentage = win_percentage
                            }
                            savePlayers()
                        } label: {
                            Image(systemName: "arrow.2.circlepath.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .offset(x: 10)
                        }
                        
                        Spacer()
                        
                        //MARK: - Setting Button
                        Button(action: {
                            // Navigate to ContentView
                        }) {
                            NavigationLink(
                                destination: SettingView(gameLevel: $gameLevel, selectedLevel: $selectedLevel, language: $language, currentPlayerIndex: $currentPlayerIndex),
                                label: {
                                    Image(systemName: "gearshape")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .offset(x: -10)
                                }

                            )
                        }
                    }
                    .offset(y: 160)
                    
                    Button(action: {
                        if currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count {
                            players.players[currentPlayerIndex].isBetAnyTriple = userHandler.isBetAnyTriple
                            highscore = players.players[currentPlayerIndex].HighScore
                            userHandler.isBetOdd = players.players[currentPlayerIndex].isBetOdd
                            userHandler.isBetEven = players.players[currentPlayerIndex].isBetEven
                            userHandler.isBetSmall = players.players[currentPlayerIndex].isBetSmall
                            userHandler.isBetBig = players.players[currentPlayerIndex].isBetBig
                            userHandler.isBetOne = players.players[currentPlayerIndex].isBetOne
                            userHandler.isBetTwo = players.players[currentPlayerIndex].isBetTwo
                            userHandler.isBetThree = players.players[currentPlayerIndex].isBetThree
                            userHandler.isBetFour = players.players[currentPlayerIndex].isBetFour
                            userHandler.isBetFive = players.players[currentPlayerIndex].isBetFive
                            userHandler.isBetSix = players.players[currentPlayerIndex].isBetSix
                            userHandler.isBetDoubleOne = players.players[currentPlayerIndex].isBetDoubleOne
                            userHandler.isBetDoubleTwo = players.players[currentPlayerIndex].isBetDoubleTwo
                            userHandler.isBetDoubleThree = players.players[currentPlayerIndex].isBetDoubleThree
                            userHandler.isBetDoubleFour = players.players[currentPlayerIndex].isBetDoubleFour
                            userHandler.isBetDoubleFive = players.players[currentPlayerIndex].isBetDoubleFive
                            userHandler.isBetDoubleSix = players.players[currentPlayerIndex].isBetDoubleSix
                            userHandler.isBetOneTwo = players.players[currentPlayerIndex].isBetOneTwo
                            userHandler.isBetOneThree = players.players[currentPlayerIndex].isBetOneThree
                            userHandler.isBetOneFour = players.players[currentPlayerIndex].isBetOneFour
                            userHandler.isBetOneFive = players.players[currentPlayerIndex].isBetOneFive
                            userHandler.isBetOneSix = players.players[currentPlayerIndex].isBetOneSix
                            userHandler.isBetTwoThree = players.players[currentPlayerIndex].isBetTwoThree
                            userHandler.isBetTwoFour = players.players[currentPlayerIndex].isBetTwoFour
                            userHandler.isBetTwoFive = players.players[currentPlayerIndex].isBetTwoFive
                            userHandler.isBetTwoSix = players.players[currentPlayerIndex].isBetTwoSix
                            userHandler.isBetThreeFour = players.players[currentPlayerIndex].isBetThreeFour
                            userHandler.isBetThreeFive = players.players[currentPlayerIndex].isBetThreeFive
                            userHandler.isBetThreeSix = players.players[currentPlayerIndex].isBetThreeSix
                            userHandler.isBetFourFive = players.players[currentPlayerIndex].isBetFourSix
                            userHandler.isBetFourSix = players.players[currentPlayerIndex].isBetFourSix
                            userHandler.isBetFiveSix = players.players[currentPlayerIndex].isBetFiveSix
                        }
                        savePlayers()
                    }) {
                        Image(systemName: "square.and.arrow.down.on.square")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .offset(x: -10)
                    }
                    .offset(y: 165)
                    .offset(x: 175)
                    
                    Spacer()
                    
                    // MARK: - Backward to MenuView
                    Button(action: {
                        // Navigate to ContentView
                    }) {
                            NavigationLink(
                                destination: MainMenuView(currentPlayerIndex: $currentPlayerIndex, selectedLevel: selectedLevel, language: language),
                                label: {
                                    Image(systemName: "arrowshape.backward.fill")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 10)
                                        .offset(x: -10)
                                }

                            )
                }
                .offset(y: 130)
                .offset(x: -155)
                    // MARK: - SHOW MONEY AND HIGHSCORE
                    HStack{
                        HStack{
                            Text("usermoney-string")
                                .modifier(ScoreLabelModifiers())
                            Text("\(coins)")
                            .modifier(ScoreNumberModifiers())
                        }
                        .modifier(ScoreCapsuleStyle())
                        .frame(width: 140, alignment: .topLeading) // set a fixed width here
                        Spacer()
                        
                        Button(action: {
                            // Navigate to InfoView
                        }) {
                                NavigationLink(
                                    destination: LeaderViewBoard( language: $language),
                                    label: {
                                        ZStack{
                                            Image(systemName: "trophy.fill")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 31, height: 31, alignment: .center)
                                                .foregroundColor(.yellow)
                                        }
                                    }

                                )
                        }

                        Spacer()
                        
                        HStack{
                            Text("Highscore-string")
                                .modifier(ScoreLabelModifiers())
                            Text("\(highscore)")
                            .modifier(ScoreNumberModifiers())
                        }
                        .modifier(ScoreCapsuleStyle())
                        .frame(width: 140, alignment: .topLeading) // set the same fixed width here
                    }
                    .padding()
                    .offset(y: -11.5)
                    
                    Spacer()
                    
                    // MARK: - Reel Machine Slot
                    VStack{
                        HStack{
                            // MARK: - First Reel
                            ReelView(reelIcon: icons[reels[0]], AnimatingIcon: animationIcon)
                            // MARK: - Second and Third Reel
                            ReelView(reelIcon: icons[reels[1]], AnimatingIcon: animationIcon)
                            ReelView(reelIcon: icons[reels[2]], AnimatingIcon: animationIcon)
                        }
                        .offset(y: -30)
                        Spacer()
                        SicboTableView(players: players, userHandler: userHandler, language: $language, currentPlayerIndex: $currentPlayerIndex)
                            .offset(y: -30)
                        Spacer()
                        
                        HStack {
                            // MARK: - Bet Money 20$ Option
                            Button {
                                ChooseBet20()
                            } label: {
                                HStack{
                                    Text("20")
                                        .modifier(BetCapsuleModifier())
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(isChooseBet20 ? 1: 0)
                                        .modifier(CasinoChipModifier())
                                }
                            }
                            Spacer()
                            
                            // MARK: - Spin Button
                            
                            Button {
                                withAnimation {
                                    animationIcon = false
                                }
                                spinReels()
                                withAnimation {
                                    animationIcon = true
                                }
                                print(reels)
                                CheckWinning()
                                print(coins)
                                print(sum3Reel)
//                                WinPercentage()S
                                print(FirstWin)
                                win_percentage = (Float(Win) / Float(Win + Lose)) * 100
                                adjustGameLogicForLevel()
                                isGameOver()
                                if currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count {
                                    getWinningStreak()
                                    CheckFirstWin()
                                    getHighScoreBadge()
                                    players.players[currentPlayerIndex].UserMoney = coins
                                    players.players[currentPlayerIndex].HighScore = highscore
                                    players.players[currentPlayerIndex].BattleNum = Battle_Num
                                    players.players[currentPlayerIndex].WinPercentage = win_percentage
                                }
                                savePlayers()
                            } label: {
                                Image("Goldspin")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .modifier(ReelImageModifier())
                                    .offset(y: -5)
                            }
                            
                            Spacer()
                            // MARK: - Bet Money 10$ Option
                            Button {
                                ChooseBet10()
                            } label: {
                                HStack{
                                    Image("YellowChips")
                                        .resizable()
                                        .modifier(CasinoChipModifier())
                                        .opacity(isChooseBet10 ? 1: 0)
                                    Text("10")
                                        .modifier(BetCapsuleModifier())
                                }
                            }
                        }
                        .padding()
                        .offset(y: -70)
                    }
                }
                //VStack
                .offset(y: 10)
                if showGameOverMessage {
                    ZStack{
                        Color("RmitBlue")
                        VStack{
                            Text("Game Over!!!")
                                .font(.system(size: 30))
                                .padding()
                                .foregroundColor(.white)
                                .frame(width:280)
                                .background(Color("RmitRed"))
                            Spacer()
                            
                            VStack{
                                Image("rmit-casino-logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200)
                                Text("You lost all your money!\nYou are not the god of gambler!")
                                    .font(.system(size: 17))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                Button {
                                    showGameOverMessage = false
                                    coins = 300
                                } label: {
                                    Text("New Game".uppercased())
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(
                                        Capsule()
                                            .fill(Color("RmitRed"))
                                        )
                                }

                            }
                            Spacer()
                        }
                    }
                    .frame(width: 280, height: 400)
                    .cornerRadius(20)
                }
                } //ZStack
                .navigationBarBackButtonHidden(true)
                .sheet(isPresented: $showLeaderBoard){
                    LeaderViewBoard(language: $language)
            }
                .environment(\.locale, Locale.init(identifier: language))
                .onAppear(perform: {
                    playSound(sound: "space-line", type: "mp3")
                    loadPlayers()
                    if currentPlayerIndex != -1 {
                        coins = players.players[currentPlayerIndex].UserMoney
                        highscore = players.players[currentPlayerIndex].HighScore
                        userHandler.isBetAnyTriple = players.players[currentPlayerIndex].isBetAnyTriple
                        userHandler.isBetOdd = players.players[currentPlayerIndex].isBetOdd
                        userHandler.isBetEven = players.players[currentPlayerIndex].isBetEven
                        userHandler.isBetSmall = players.players[currentPlayerIndex].isBetSmall
                        userHandler.isBetBig = players.players[currentPlayerIndex].isBetBig
                        userHandler.isBetOne = players.players[currentPlayerIndex].isBetOne
                        userHandler.isBetTwo = players.players[currentPlayerIndex].isBetTwo
                        userHandler.isBetThree = players.players[currentPlayerIndex].isBetThree
                        userHandler.isBetFour = players.players[currentPlayerIndex].isBetFour
                        userHandler.isBetFive = players.players[currentPlayerIndex].isBetFive
                        userHandler.isBetSix = players.players[currentPlayerIndex].isBetSix
                        userHandler.isBetDoubleOne = players.players[currentPlayerIndex].isBetDoubleOne
                        userHandler.isBetDoubleTwo = players.players[currentPlayerIndex].isBetDoubleTwo
                        userHandler.isBetDoubleThree = players.players[currentPlayerIndex].isBetDoubleThree
                        userHandler.isBetDoubleFour = players.players[currentPlayerIndex].isBetDoubleFour
                        userHandler.isBetDoubleFive = players.players[currentPlayerIndex].isBetDoubleFive
                        userHandler.isBetDoubleSix = players.players[currentPlayerIndex].isBetDoubleSix
                        userHandler.isBetOneTwo = players.players[currentPlayerIndex].isBetOneTwo
                        userHandler.isBetOneThree = players.players[currentPlayerIndex].isBetOneThree
                        userHandler.isBetOneFour = players.players[currentPlayerIndex].isBetOneFour
                        userHandler.isBetOneFive = players.players[currentPlayerIndex].isBetOneFive
                        userHandler.isBetOneSix = players.players[currentPlayerIndex].isBetOneSix
                        userHandler.isBetTwoThree = players.players[currentPlayerIndex].isBetTwoThree
                        userHandler.isBetTwoFour = players.players[currentPlayerIndex].isBetTwoFour
                        userHandler.isBetTwoFive = players.players[currentPlayerIndex].isBetTwoFive
                        userHandler.isBetTwoSix = players.players[currentPlayerIndex].isBetTwoSix
                        userHandler.isBetThreeFour = players.players[currentPlayerIndex].isBetThreeFour
                        userHandler.isBetThreeFive = players.players[currentPlayerIndex].isBetThreeFive
                        userHandler.isBetThreeSix = players.players[currentPlayerIndex].isBetThreeSix
                        userHandler.isBetFourFive = players.players[currentPlayerIndex].isBetFourSix
                        userHandler.isBetFourSix = players.players[currentPlayerIndex].isBetFourSix
                        userHandler.isBetFiveSix = players.players[currentPlayerIndex].isBetFiveSix
                    }
                })
        }
    }
    
    func savePlayers() {
        do{
            let encodedPlayers = try JSONEncoder().encode(players.players)
            playerData = encodedPlayers
        } catch {
            print("Error Saving players: ")
        }
    }
    
    func loadPlayers() {
        do{
            let decodedPlayers = try JSONDecoder().decode([Player].self, from: playerData)
            players.players = decodedPlayers
        } catch {
            print("Error Loading Players")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentPlayerIndex: .constant(-1))
    }
}
