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
                                        .opacity(userHandler.isChooseBetSmall ? 1 : 0 )
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
                                        .opacity(userHandler.isChooseBetBig ? 1 : 0 )
                                        .modifier(CasinoChipModifier())
                                }
                            )
                    }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 120, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay(
                            VStack{
                                Text("Any Triple").foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                                .modifier(ScoreLabelModifiers())
                            }
                        )
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay(
                            VStack{
                                Text("ODD").foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                                .modifier(ScoreLabelModifiers())
                            }
                        )
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay(
                            VStack{
                                Text("EVEN").foregroundColor(.white)
                                .font(.system(size: 20))
                                .bold()
                                .modifier(ScoreLabelModifiers())
                            }
                        )
                }
                HStack {
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            Image("red_dice1")
                                .resizable()
                                .frame(width:40, height: 40, alignment: .center)
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            Image("red_dice2")
                                .resizable()
                                .frame(width:40, height: 40, alignment: .center)
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            Image("red_dice3")
                                .resizable()
                                .frame(width:40, height: 40, alignment: .center)
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            Image("red_dice4")
                                .resizable()
                                .frame(width:40, height: 40, alignment: .center)
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            Image("red_dice5")
                                .resizable()
                                .frame(width:40, height: 40, alignment: .center)
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 50, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            Image("red_dice6")
                                .resizable()
                                .frame(width:40, height: 40, alignment: .center)
                        }
                }
                HStack {
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                }
                HStack {
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice1")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                }
                HStack {
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice2")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice3")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                }
                HStack{
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice4")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                            }
                        }
                    Rectangle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 57, height: 100, alignment: .center)
                        .cornerRadius(10)
                        .overlay {
                            VStack{
                                Image("red_dice5")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
                                Image("red_dice6")
                                    .resizable()
                                    .frame(width:40, height: 40, alignment: .center)
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
