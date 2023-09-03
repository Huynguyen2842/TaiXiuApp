//
//  LeaderViewBoard.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import SwiftUI

struct LeaderViewBoard: View {
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players:PlayerModel = PlayerModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
//            LogoView()         
            VStack{
//                Text("\(currentPlayerIndex)")
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.square.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                NavigationView {
                            List(players.players, id: \.id) { player in
                                LeaderBoardRow(player: player)
                            }
                            .navigationTitle("Leaderboard")
                }
            }
        }
        .onAppear{
            loadPlayers()
        }
    }
    
    func loadPlayers() {   
        do{
            let decodedPlayers = try JSONDecoder().decode([Player].self, from: playerData)
            let sortedPlayers = decodedPlayers.sorted(by: { $0.HighScore > $1.HighScore })
                    players.players = sortedPlayers
        } catch {
            print("Error Loading Players")
        }
    }
}

struct LeaderViewBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderViewBoard()
            .environmentObject(PlayerModel())
    }
}
