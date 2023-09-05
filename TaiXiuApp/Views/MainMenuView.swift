//
//  MainMenuView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import SwiftUI

struct MainMenuView: View {
    @Binding var currentPlayerIndex: Int
    @State var gameLevel: Int = 1
    @State var selectedLevel: Int = 1
    @State var language: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ZStack{
                VStack {
                    ZStack {
                        Color.red
                            .ignoresSafeArea(.all)
                        VStack (spacing: 0) {
                            Spacer()
                            
                            Button(action: {
                                // Navigate to ContentView
                            }) {
                                    NavigationLink(
                                        destination: RegisterLoginView(language: $language),
                                        label: {
                                            ZStack{
                                                Image(systemName: "arrowshape.backward.fill")
                                                    .font(.title2)
                                                    .foregroundColor(.black)
                                                    .padding(.horizontal, 10)
                                                    .offset(x: -10)
                                            }
                                        }

                                    )
                        }
                            .offset(y: -50)
                            .offset(x: -155)
                            
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
                                            destination: ContentView(gameLevel: gameLevel, selectedLevel: selectedLevel, language: language, currentPlayerIndex: $currentPlayerIndex),
                                            label: {
                                                ZStack{
                                                    Image("playButton 1")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 200, height: 100)
                                                    
                                                    Text("Start-string")
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
                                                    Text("How-to-play-string")
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
                                            destination: SettingView(gameLevel: $gameLevel, selectedLevel: $selectedLevel, language: $language, currentPlayerIndex: $currentPlayerIndex),
                                            label: {
                                                ZStack{
                                                    Image("playButton 1")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width:200, height: 100, alignment: .center)
                                                    Text("Setting-string")
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
                                            destination: LeaderViewBoard( language: $language),
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
            .onAppear(perform: {
                playSound(sound: "mainmenuView", type: "mp3")
            })
            .environment(\.locale, Locale.init(identifier: language))
            }
        .navigationBarBackButtonHidden(true)
        }
    }

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(currentPlayerIndex: .constant(-1))
    }
}
