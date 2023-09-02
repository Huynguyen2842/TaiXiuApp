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
                        Color("Green")
                            .ignoresSafeArea(.all)
                        Image("taixiulogo")
                            .resizable()
                            .frame(width: 150, height: 150, alignment: .center)
                            .offset(y: -100)
                
                        Button(action: {
                            // Navigate to ContentView
                        }) {
                                NavigationLink(
                                    destination: ContentView(currentPlayerIndex: $currentPlayerIndex),
                                    label: {
                                        Image("play_button")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 200, height: 200)
                                        
                                       
                                    }
                                    
                                   
                                )
                        }
                        .offset(y: 200)
                    }
                }
        
            }
            }
        }
    }

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(currentPlayerIndex: .constant(0))
    }
}
