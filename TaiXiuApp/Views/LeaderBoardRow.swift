//
//  LeaderBoardRow.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 03/09/2023.
//

import SwiftUI

struct LeaderBoardRow: View {
    let player: Player

    var body: some View {
        VStack {
            HStack (spacing: 0) {
                Text(player.username)
                    .font(.title3)
                    .fontWeight(.bold)
                    
                Spacer()
                Text("Money: \(player.UserMoney)")
                Spacer()
                Text("High Score: \(player.HighScore)")
               
            }
            .padding(.horizontal, 12)
            
            VStack{
                ForEach(0..<player.achievements.count, id: \.self) { index in
                    HStack {
                    Image(player.achievements[index].image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40) // adjust size to your preference
                    Text("Achievement \(index + 1): \(player.achievements[index].name)")
                    }
                    
                }
            }
        }
        .border(.black)
    }
}

struct LeaderBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardRow(player: Player(id: 0, username: "thaile", password: "", HighScore: 0, UserMoney: 0, achievements: [Achievement(name: "First Win", image: "champion")]))
    }
}
