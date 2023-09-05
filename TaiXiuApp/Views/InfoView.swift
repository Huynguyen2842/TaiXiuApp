//
//  InfoView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 01/09/2023.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.red.ignoresSafeArea()
            VStack(alignment: .center, spacing: 10) {
              LogoView()
              
              Spacer()
              
              Form {
                Section(header: Text("How To Play")) {
                    Text("Just spin the reels to play.")
                    Text("Matching all icons to win.")
                    Text("The winning amount will be 10x of your betting amount.")
                    Text("You can reset the money and highscore by clicking on the button Reset.")
                }
                  Section(header: Text("Application Information")) {
                      HStack {
                        Text("App Name")
                        Spacer()
                        Text("Tai Xiu App")
                      }
                      HStack {
                        Text("Course")
                        Spacer()
                        Text("COSC2659")
                      }
                      HStack {
                        Text("Year Published")
                        Spacer()
                        Text("2023")
                      }
                      HStack {
                        Text("Location")
                        Spacer()
                        Text("Saigon South Campus")
                      }
                }
              }
              .font(.system(.body, design: .rounded))
            }
            .padding(.top, 40)
            .navigationBarBackButtonHidden(true)  // Add this line to hide the back button
            .overlay(
              Button(action: {
                audioPlayer?.stop()
                dismiss()
              }) {
                Image(systemName: "xmark.circle")
                  .font(.title)
              }
              .foregroundColor(.white)
              .padding(.top, 30)
              .padding(.trailing, 20),
              alignment: .topTrailing
              )
              .onAppear(perform: {
                playSound(sound: "drum-music", type: "mp3")
              })
        }
        .onAppear(){
            playSound(sound: "HowToPlay", type: "mp3")
        }

    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
