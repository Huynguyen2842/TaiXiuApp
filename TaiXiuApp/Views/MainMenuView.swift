//
//  MainMenuView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import SwiftUI

struct MainMenuView: View {
    @Binding var currentPlayerIndex: Int
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    ZStack {
                        Color.red
                            .ignoresSafeArea(.all)
                        VStack (spacing: 0) {
                            Spacer()
                           
                            Image("taixiulogo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                            Spacer()
    
                            ZStack {
                                Button(action: {
                                    // Navigate to ContentView
                                }) {
                                        NavigationLink(
                                            destination: ContentView(currentPlayerIndex: $currentPlayerIndex),
                                            label: {
                                                ZStack{
                                                    Image("playButton 1")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 200, height: 100)
                                                    
                                                    Text("Start")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                                    .font(.title2)
                                                    .modifier(ScoreNumberModifiers())
                                                    .modifier(ShadowModifiers())
                                                }
                                            }

                                        )
                            }
                            }
            
                            ZStack {
                                Button(action: {
                                    // Navigate to InfoView
                                }) {
                                        NavigationLink(
                                            destination: InfoView(),
                                            label: {
                                                ZStack{
                                                    Image("playButton 1")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width:200, height: 100, alignment: .center)
                                                    Text("How to Play")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                                    .font(.title2)
                                                    .modifier(ScoreNumberModifiers())
                                                    .modifier(ShadowModifiers())
                                                }
                                            }

                                        )
                            }
                            }
    
                            ZStack {
                                Button(action: {
                                    // Navigate to InfoView
                                }) {
                                        NavigationLink(
                                            // SettingView(selectedLevel: $selectedLevel)
                                            destination: InfoView(),
                                            label: {
                                                ZStack{
                                                    Image("playButton 1")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width:200, height: 100, alignment: .center)
                                                    Text("Setting")
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                                    .font(.title2)
                                                    .modifier(ScoreNumberModifiers())
                                                    .modifier(ShadowModifiers())
                                                }
                                            }

                                        )
                            }
                            }
          
                            ZStack {
                                Button(action: {
                                    // Navigate to InfoView
                                }) {
                                        NavigationLink(
                                            destination: LeaderViewBoard(),
                                            label: {
                                                ZStack{
                                                    Image("leaderboard")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width:130, height: 130, alignment: .center)
                                                    .foregroundColor(.white)
                                                    .fontWeight(.bold)
                                                    .font(.title)
                                                }
                                            }

                                        )
                            }
                            }
                            Spacer()
                        }
                    }
                }
        
            }
            }
        }
    }

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(currentPlayerIndex: .constant(-1))
    }
}
