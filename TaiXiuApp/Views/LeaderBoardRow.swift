//
//  LeaderBoardRow.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 03/09/2023.
//

import SwiftUI

struct LeaderBoardRow: View {
    let player: Player
    @State var language: String = ""
    @AppStorage("isDrakMode") var isDark: Bool = false

    var body: some View {
        VStack(spacing: 15) {
            VStack {
                Text(player.username)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue) // Add a subtle color for the username
                Spacer() // To push the VStack to the right side
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("money-string")
                            .font(.system(size: 15))
                            .foregroundStyle(.green)
                        Spacer()
                        Text("\(player.UserMoney)")
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                    }

                    HStack {
                        Text("highscore-string")
                            .font(.system(size: 15))
                            .foregroundStyle(.red)
                        Spacer()
                        Text("\(player.HighScore)")
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                    }

                    HStack {
                        Text("win-percentage-string")
                            .font(.system(size: 15))
                            .foregroundStyle(.orange)
                        Spacer()
                        Text("\(String(format: "%.2f", player.WinPercentage))%")
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                    }
                    
                    HStack {
                        Text("battle-played-string")
                            .font(.system(size: 15))
                            .foregroundStyle(.purple)
                        Spacer()
                        Text("\(player.BattleNum)")
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                    }
                }
                .padding(.all, 10)
                .background(Color.gray.opacity(0.1)) // Add a background color for better distinction
                .cornerRadius(10) // Round the corners
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5) // A subtle shadow
            }
            .padding(.horizontal, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<player.achievements.count, id: \.self) { index in
                        VStack {
                            Image(player.achievements[index].image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            Text(player.achievements[index].name)
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10) // Outer shadow for the main card
        .environment(\.locale, Locale.init(identifier: language))
        .border(Color.gray.opacity(0.3), width: 0.5)
        .environment(\.colorScheme, isDark ? .dark : .light)
    }

    // This function helps in reusing the row design.
    func dataRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.system(size: 15))
                .fontWeight(.semibold)
        }
        .environment(\.locale, Locale.init(identifier: language))
    }
}

struct LeaderBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardRow(player: Player(id: 0, username: "huynguyen", password: "", HighScore: 0, UserMoney: 0, BattleNum: 0,WinPercentage: 0,achievements: [Achievement(name: "First Win", image: "champion")], isBetAnyTriple: false))
    }
}
