import Foundation
import SwiftUI
import UIKit
struct LeaderViewBoard: View {
    @AppStorage("isDrakMode") var isDark: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players: PlayerModel = PlayerModel()
    @Binding var language: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            NavigationView {
                List(players.players, id: \.id) { player in
                    LeaderBoardRow(player: player, language: language)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10) // Enhanced shadow here
                        .padding(.vertical, 8)
                }
                .listStyle(.plain) // Removes default lines
                .navigationTitle("Leader-board-string")
                .navigationBarTitleDisplayMode(.large) // Large title for the navigation
                .navigationBarItems(leading:
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                )
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = isDark ? UIColor.black : UIColor.white
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : isDark ? UIColor.white : UIColor.black]
                    nc.navigationBar.tintColor = isDark ? UIColor.white : UIColor.blue
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.locale, Locale.init(identifier: language))
        .environment(\.colorScheme, isDark ? .dark : .light)
        .onAppear(perform: {
            loadPlayers()
            playSound(sound: "leaderboardview", type: "mp3")
        })
    }
    
    func loadPlayers() {
        do {
            let decodedPlayers = try JSONDecoder().decode([Player].self, from: playerData)
            let sortedPlayers = decodedPlayers.sorted(by: { $0.HighScore > $1.HighScore })
            players.players = sortedPlayers
        } catch {
            print("Error Loading Players")
        }
    }
}

// Helper to customize navigation appearance
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
}

struct LeaderViewBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderViewBoard(language: .constant("en"))
            .environmentObject(PlayerModel())
    }
}
