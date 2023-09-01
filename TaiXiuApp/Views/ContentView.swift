//
//  ContentView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 30/08/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let icons = ["dice1","dice2","dice3","dice4","dice5","dice6"]
//    let icons = ["apple","bar","bell"]
    @EnvironmentObject var userHandler: UserHandler
    @State var reels = [0,1,2]
    @State var coins = 100
    @State var betAmount = 10
    @AppStorage ("highscore") var highscore = 0
    @State var isChooseBet10 = true
    @State var isChooseBet20 = false
    @State var animationIcon = true
    @State var showGameOverMessage = false
    @State var showInfoView = false
    @State var NumReel0 = 0
    @State var NumReel1 = 0
    @State var NumReel2 = 0
    @State var sum3Reel = 0
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
        
        NumReel0 = reels[0] + 1
        NumReel1 = reels[1] + 1
        NumReel2 = reels[2] + 1
        
        sum3Reel = NumReel0 + NumReel1 + NumReel2
        
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[2] == reels[0] {
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
    }
    // MARK: - PLAYER WINING LOGIC
    func PlayerWins(){
        coins += betAmount*10
    }
    // MARK: - HIGHSCCORE LOGIC
    func newHighScore(){
        highscore = coins
        UserDefaults.standard.set(highscore, forKey: "highscore")
    }
    // MARK: - PLAYER LOSING LOGIC
    func PlayerLoses(){
        coins -= betAmount;
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
            showGameOverMessage = true
            playSound(sound: "gameover", type: "mp3")
        }
    }
    // MARK: - RESET GAME LOGIC 
    
    var body: some View {
        ZStack{
            // MARK: - BACKGROUND
            
//            LinearGradient(gradient: Gradient(colors: [Color("RmitRed"),Color("RmitPurple")]), startPoint:.top, endPoint: .bottom)
            Color("Green")
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - LOGO HEADER
            VStack{
                HStack{
                    Button {
                        showInfoView = true
                    } label: {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .offset(x: 10)
                    }
                    
                    Spacer()
                    
                    Button {
                        showInfoView = true
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .offset(x: -10)
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
                    
                    SicboTableView()
                    
                    Spacer()
                    
                    HStack {
                        // MARK: - Bet Money 20$ Option
                        Button {
                            ChooseBet20()
                        } label: {
                            HStack{
                                Text("20")
                                    .modifier(BetCapsuleModifier())
                                Image("casino-chips")
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
                            isGameOver()
                            
                        } label: {
                            Image("spin")
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
                                Image("casino-chips")
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
        .sheet(isPresented: $showInfoView){
            InfoView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserHandler())
    }
}

