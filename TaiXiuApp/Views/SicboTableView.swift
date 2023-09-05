//
//  SicboTableView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 01/09/2023.
//

import SwiftUI

struct SicboTableView: View {
    @AppStorage("players") private var playerData: Data = Data()
    @ObservedObject var players:PlayerModel
    @ObservedObject var userHandler: UserHandler
    @Binding var language: String
    @Binding var currentPlayerIndex: Int
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button {
                        userHandler.chooseBetSmall()
                        players.players[currentPlayerIndex].isBetSmall = userHandler.isBetSmall
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack{
                                    VStack{
                                        Text("small-string").foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .bold()
                                        .modifier(ScoreLabelModifiers())
                                        Text("4-10").foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .bold()
                                        .modifier(ScoreNumberModifiers())
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetSmall ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            )
                    }

                    Button {
                        userHandler.chooseBetBig()
                        players.players[currentPlayerIndex].isBetBig = userHandler.isBetBig
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("big-string").foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .bold()
                                        .modifier(ScoreLabelModifiers())
                                        Text("11-17").foregroundColor(.white)
                                        .font(.system(size: 15))
                                        .bold()
                                        .modifier(ScoreNumberModifiers())
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetBig ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            )
                    }
                    
                    Button {
                        userHandler.chooseBetAnyTriple()
                        players.players[currentPlayerIndex].isBetAnyTriple = userHandler.isBetAnyTriple
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 120, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("Any-Triple-string").foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .bold()
                                        .modifier(ScoreLabelModifiers())
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetAnyTriple ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            )
                    }
                    
                    Button {
                        userHandler.chooseBetOdd()
                        players.players[currentPlayerIndex].isBetOdd = userHandler.isBetOdd
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("Odd-string").foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .bold()
                                        .modifier(ScoreLabelModifiers())
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOdd ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            )
                    }
                    
                    Button {
                        userHandler.chooseBetEven()
                        players.players[currentPlayerIndex].isBetEven = userHandler.isBetEven
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("Even-string").foregroundColor(.white)
                                        .font(.system(size: 20))
                                        .bold()
                                        .modifier(ScoreLabelModifiers())
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetEven ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            )
                    }
                }
                HStack {
//                    Rectangle()
//                        .fill(Color("DarkGreen"))
//                        .frame(width: 57, height: 50, alignment: .center)
//                        .cornerRadius(10)
//                        .overlay {
//                            Image("red_dice1")
//                                .resizable()
//                                .frame(width:40, height: 40, alignment: .center)
//                        }
                    
                    Button {
                        userHandler.chooseBetOne()
                        players.players[currentPlayerIndex].isBetOne = userHandler.isBetOne
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOne ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetTwo()
                        players.players[currentPlayerIndex].isBetTwo = userHandler.isBetTwo
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetTwo ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetThree()
                        players.players[currentPlayerIndex].isBetThree = userHandler.isBetThree
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetThree ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetFour()
                        players.players[currentPlayerIndex].isBetFour = userHandler.isBetFour
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetFour ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetFive()
                        players.players[currentPlayerIndex].isBetFive = userHandler.isBetFive
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetFive ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetSix()
                        players.players[currentPlayerIndex].isBetSix = userHandler.isBetSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                                
                                
                            }
                    }
                }
                HStack {
                    Button {
                        userHandler.chooseBetDoubleOne()
                        players.players[currentPlayerIndex].isBetDoubleOne = userHandler.isBetDoubleOne
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetDoubleOne ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetDoubleTwo()
                        players.players[currentPlayerIndex].isBetDoubleTwo = userHandler.isBetDoubleTwo
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetDoubleTwo ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetDoubleThree()
                        players.players[currentPlayerIndex].isBetDoubleThree = userHandler.isBetDoubleThree
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetDoubleThree ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetDoubleFour()
                        players.players[currentPlayerIndex].isBetDoubleFour = userHandler.isBetDoubleFour
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetDoubleFour ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetDoubleFive()
                        players.players[currentPlayerIndex].isBetDoubleFive = userHandler.isBetDoubleFive
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetDoubleFive ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetDoubleSix()
                        players.players[currentPlayerIndex].isBetDoubleSix = userHandler.isBetDoubleSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetDoubleSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                }
                HStack {
                    Button {
                        userHandler.chooseBetOneTwo()
                        players.players[currentPlayerIndex].isBetOneTwo = userHandler.isBetOneTwo
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOneTwo ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetOneThree()
                        players.players[currentPlayerIndex].isBetOneThree = userHandler.isBetOneThree
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOneThree ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetOneFour()
                        players.players[currentPlayerIndex].isBetOneFour = userHandler.isBetOneFour
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOneFour ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetOneFive()
                        players.players[currentPlayerIndex].isBetOneFive = userHandler.isBetOneFive
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOneFive ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetOneSix()
                        players.players[currentPlayerIndex].isBetOneSix = userHandler.isBetOneSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice1")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetOneSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetTwoThree()
                        players.players[currentPlayerIndex].isBetTwoThree = userHandler.isBetTwoThree
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetTwoThree ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                }
                HStack {
                    Button {
                        userHandler.chooseBetTwoFour()
                        players.players[currentPlayerIndex].isBetTwoFour = userHandler.isBetTwoFour
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetTwoFour ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetTwoFive()
                        players.players[currentPlayerIndex].isBetTwoFive = userHandler.isBetTwoFive
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetTwoFive ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    Button {
                        userHandler.chooseBetTwoSix()
                        players.players[currentPlayerIndex].isBetTwoSix = userHandler.isBetTwoSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetTwoSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetThreeFour()
                        players.players[currentPlayerIndex].isBetThreeFour = userHandler.isBetThreeFour
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetThreeFour ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetThreeFive()
                        players.players[currentPlayerIndex].isBetThreeFive = userHandler.isBetThreeFive
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice2")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetThreeFive ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetThreeSix()
                        players.players[currentPlayerIndex].isBetThreeSix = userHandler.isBetThreeSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice3")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetThreeSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                }
                HStack{
                    Button {
                        userHandler.chooseBetFourFive()
                        players.players[currentPlayerIndex].isBetFourFive = userHandler.isBetFourFive
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetFourFive ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetFourSix()
                        players.players[currentPlayerIndex].isBetFourSix = userHandler.isBetFourSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice4")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetFourSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                    
                    Button {
                        userHandler.chooseBetFiveSix()
                        players.players[currentPlayerIndex].isBetFiveSix = userHandler.isBetFiveSix
                        savePlayers()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 100, alignment: .center)
                            .cornerRadius(10)
                            .overlay {
                                ZStack {
                                    VStack{
                                        Image("red_dice5")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                        Image("red_dice6")
                                            .resizable()
                                            .frame(width:40, height: 40, alignment: .center)
                                    }
                                    Image("YellowChips")
                                        .resizable()
                                        .opacity(userHandler.isBetFiveSix ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            }
                    }
                }
            }
//                .fill(Color("Green"))
//                .frame(width: 100, height: 140, alignment: .center)
//                .cornerRadius(10)
//                Text("Tai".uppercased())
//                .modifier(TableLabelModifiers())
        }
        .environment(\.locale, Locale.init(identifier: language))
    }
    
    func savePlayers() {
        do{
            let encodedPlayers = try JSONEncoder().encode(players.players)
            playerData = encodedPlayers
        } catch {
            print("Error Saving players: ")
        }
    }
}

struct SicboTableView_Previews: PreviewProvider {
    static var previews: some View {
        SicboTableView(players: PlayerModel(), userHandler: UserHandler(), language: .constant("en"), currentPlayerIndex: .constant(-1))
    }
}
