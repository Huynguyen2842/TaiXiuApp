//
//  SicboTableView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 01/09/2023.
//

import SwiftUI

struct SicboTableView: View {
    @ObservedObject var userHandler: UserHandler
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button {
                        userHandler.chooseBetSmall()
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack{
                                    VStack{
                                        Text("Small").foregroundColor(.white)
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
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("Big").foregroundColor(.white)
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
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 120, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("Any Triple").foregroundColor(.white)
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
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("ODD").foregroundColor(.white)
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
                    } label: {
                        Rectangle()
                            .fill(Color("DarkGreen"))
                            .frame(width: 57, height: 50, alignment: .center)
                            .cornerRadius(10)
                            .overlay(
                                ZStack {
                                    VStack{
                                        Text("EVEN").foregroundColor(.white)
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
    }
}

struct SicboTableView_Previews: PreviewProvider {
    static var previews: some View {
        SicboTableView(userHandler: UserHandler())
    }
}
