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
    @State var AchivementPlayerIndex: Int = -1
    // MARK: - PROPERTIES
    let icons = ["dice1","dice2","dice3","dice4","dice5","dice6"]
//    let icons = ["apple","bar","bell"]
    @EnvironmentObject var userProgress: UserHandler
    @StateObject var userHandler = UserHandler()
    @State var BetRatios: Int = 1
    @State var reels = [0,1,2]
    @State var coins = 500
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
        
        
        //MARK: - CHECK IF USER CHOOSES ANY TRIPLE
        if (userHandler.isBetAnyTriple == true){
            if (NumReel0 == NumReel1 && NumReel1 == NumReel2 && NumReel2 == NumReel0){
                //WINING LOGIC
                PlayerWins()
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
            let newAchievement = Achievement(name: "Win Triple", image: "champion")
            addAchievementToPlayer(player: &players.players[currentPlayerIndex], achievement: newAchievement)

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
        
        //MARK: - CHECK IF USER BETS DOUBLE TWO
        if (userHandler.isBetDoubleTwo == true) {
            if ((NumReel0 == 2 && NumReel1 == 2) || (NumReel0 == 2 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 2)){
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
        
        //MARK: - CHECK IF USER BETS DOUBLE THREE
        if (userHandler.isBetDoubleThree == true) {
            if ((NumReel0 == 3 && NumReel1 == 3) || (NumReel0 == 3 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 3)){
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
        
        //MARK: - CHECK IF USER BETS DOUBLE FOUR
        if (userHandler.isBetDoubleFour == true) {
            if ((NumReel0 == 4 && NumReel1 == 4) || (NumReel0 == 4 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 4)){
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
        
        //MARK: - CHECK IF USER BETS DOUBLE FIVE
        if (userHandler.isBetDoubleFive == true) {
            if ((NumReel0 == 5 && NumReel1 == 5) || (NumReel0 == 5 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 5)){
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
        
        //MARK: - CHECK IF USER BETS DOUBLE SIX
        if (userHandler.isBetDoubleSix == true) {
            if ((NumReel0 == 6 && NumReel1 == 6) || (NumReel0 == 6 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 6)){
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
        
        //MARK: - CHECK IF USER BETS ONE TWO
        if (userHandler.isBetOneTwo == true) {
            if ((NumReel0 == 1 && NumReel1 == 2) || (NumReel0 == 2 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 2) || (NumReel0 == 2 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 1)){
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
        
        //MARK: - CHECK IF USER BETS ONE THREE
        if (userHandler.isBetOneThree == true) {
            if ((NumReel0 == 1 && NumReel1 == 3) || (NumReel0 == 3 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 3) || (NumReel0 == 3 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 1)){
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
        
        //MARK: - CHECK IF USER BETS ONE FOUR
        if (userHandler.isBetOneFour == true) {
            if ((NumReel0 == 1 && NumReel1 == 4) || (NumReel0 == 4 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 4) || (NumReel0 == 4 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 1)){
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
        
        //MARK: - CHECK IF USER BETS ONE FIVE
        if (userHandler.isBetOneFive == true) {
            if ((NumReel0 == 1 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 1)){
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
        
        //MARK: - CHECK IF USER BETS ONE SIX
        if (userHandler.isBetOneSix == true) {
            if ((NumReel0 == 1 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 1)
                || (NumReel0 == 1 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 1) || (NumReel1 == 1 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 1)){
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
        
        //MARK: - CHECK IF USER BETS TWO THREE
        if (userHandler.isBetTwoThree == true) {
            if ((NumReel0 == 2 && NumReel1 == 3) || (NumReel0 == 3 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 3) || (NumReel0 == 3 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 2)){
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
        
        //MARK: - CHECK IF USER BETS TWO FOUR
        if (userHandler.isBetTwoFour == true) {
            if ((NumReel0 == 2 && NumReel1 == 4) || (NumReel0 == 4 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 4) || (NumReel0 == 4 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 2)){
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
        
        //MARK: - CHECK IF USER BETS TWO FIVE
        if (userHandler.isBetTwoFive == true) {
            if ((NumReel0 == 2 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 2)){
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
        
        //MARK: - CHECK IF USER BETS TWO SIX
        if (userHandler.isBetTwoSix == true) {
            if ((NumReel0 == 2 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 2)
                || (NumReel0 == 2 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 2) || (NumReel1 == 2 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 2)){
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
        
        //MARK: - CHECK IF USER BETS THREE FOUR
        if (userHandler.isBetThreeFour == true) {
            if ((NumReel0 == 3 && NumReel1 == 4) || (NumReel0 == 4 && NumReel1 == 3)
                || (NumReel0 == 3 && NumReel2 == 4) || (NumReel0 == 4 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 3)){
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
        
        //MARK: - CHECK IF USER BETS THREE FIVE
        if (userHandler.isBetThreeFive == true) {
            if ((NumReel0 == 3 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 3)
                || (NumReel0 == 3 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 3)){
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
        
        //MARK: - CHECK IF USER BETS THREE SIX
        if (userHandler.isBetThreeSix == true) {
            if ((NumReel0 == 3 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 3)
                || (NumReel0 == 3 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 3) || (NumReel1 == 3 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 3)){
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
        
        //MARK: - CHECK IF USER BETS FOUR FIVE
        if (userHandler.isBetFourFive == true) {
            if ((NumReel0 == 4 && NumReel1 == 5) || (NumReel0 == 5 && NumReel1 == 4)
                || (NumReel0 == 4 && NumReel2 == 5) || (NumReel0 == 5 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 4)){
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
        
        //MARK: - CHECK IF USER BETS FOUR SIX
        if (userHandler.isBetFourSix == true) {
            if ((NumReel0 == 4 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 4)
                || (NumReel0 == 4 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 4) || (NumReel1 == 4 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 4)){
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
        
        //MARK: - CHECK IF USER BETS FIVE SIX
        if (userHandler.isBetFiveSix == true) {
            if ((NumReel0 == 5 && NumReel1 == 6) || (NumReel0 == 6 && NumReel1 == 5)
                || (NumReel0 == 5 && NumReel2 == 6) || (NumReel0 == 6 && NumReel2 == 5) || (NumReel1 == 5 && NumReel2 == 6) || (NumReel1 == 6 && NumReel2 == 5)){
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
    }
    
    // MARK: - PLAYER WINING LOGIC
    func PlayerWins(){
        coins += betAmount*BetRatios
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
            playSound(sound: "gameover", type: "mp3")
        }
    }
    // MARK: - RESET GAME LOGIC
    func resetGame(){
        highscore = 0
        coins = 100
        ChooseBet10()
        playSound(sound: "ring-up", type: "mp3")
    }
    
    var body: some View {
        NavigationView {
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
                        } label: {
                            Image(systemName: "arrow.2.circlepath.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .offset(x: 10)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Navigate to ContentView
                        }) {
                                NavigationLink(
                                    destination: SettingView(gameLevel: $gameLevel, selectedLevel: $selectedLevel, currentPlayerIndex: $currentPlayerIndex),
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
                    .offset(y: 140)
                    // MARK: - SHOW MONEY AND HIGHSCORE
                    HStack{
                        HStack{
                            Text("Your\nMoney".uppercased())
                                .modifier(ScoreLabelModifiers())
                            Text("\(coins)")
                            .modifier(ScoreNumberModifiers())
                        }
                        .modifier(ScoreCapsuleStyle())
                        
                        Spacer()
                        Button {
                            showLeaderBoard = true
                        } label: {
                            Image(systemName: "trophy.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 31, height: 31, alignment: .center)
                                .foregroundColor(.yellow)
                        }

                        Spacer()
                        
                        HStack{
                            Text("High\nScore".uppercased())
                                .modifier(ScoreLabelModifiers())
                            Text("\(highscore)")
                            .modifier(ScoreNumberModifiers())
                        }
                        .modifier(ScoreCapsuleStyle())
                    }
                    .padding()
                    .offset(y: 15)
                    
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
                        
                        SicboTableView(userHandler: userHandler)
                        
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
                                adjustGameLogicForLevel()
                                isGameOver()
                                if currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count {
                                    players.players[currentPlayerIndex].UserMoney = coins
                                    players.players[currentPlayerIndex].HighScore = highscore
                                }
                                savePlayers()
                            } label: {
                                Image("Goldspin")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .modifier(ReelImageModifier())
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
                        .offset(y: -40)
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
                                    coins = 100
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
                .sheet(isPresented: $showLeaderBoard){
                    LeaderViewBoard()
            }
            .onAppear{
                playSound(sound: "drum-music", type: "mp3")
                loadPlayers()
                if currentPlayerIndex != -1 {
                    coins = players.players[currentPlayerIndex].UserMoney
                    highscore = players.players[currentPlayerIndex].HighScore
                }
        }
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

