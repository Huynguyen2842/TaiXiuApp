//
//  SettingView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 03/09/2023.
//

import SwiftUI

struct SettingView: View {
    
    @State private var isLoggedIn: Bool = true
    @Binding var gameLevel: Int
    @Binding var selectedLevel: Int
    @Binding var currentPlayerIndex: Int
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players:PlayerModel = PlayerModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        if isLoggedIn {
            // ... the rest of your SettingView code
            VStack {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
                Text("Username: \(currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count ? players.players[currentPlayerIndex].username : "Unknown")")
                .font(.title2)
                .padding(.bottom, 20)
            Picker("Select Level", selection: $selectedLevel) {
                Text("Easy").tag(1)
                Text("Medium").tag(2)
                Text("Hard").tag(3)
            }.onChange(of: selectedLevel, perform: { _ in
                print(selectedLevel)
            })
            .pickerStyle(SegmentedPickerStyle())
            Button("Logout") {
                currentPlayerIndex = -1
                isLoggedIn = false
                
            }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                .padding(.top, 20)
            Button("Close") {
                dismiss()
            }
            .padding(.top, 20)
            }.onAppear(){
                loadPlayers()
            }
            .padding()
        } else {
            // Redirect to the RegisterLoginView or some other view
            RegisterLoginView()
                .navigationBarBackButtonHidden(true)
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(gameLevel: .constant(1), selectedLevel: .constant(1), currentPlayerIndex: .constant(-1))
    }
}
