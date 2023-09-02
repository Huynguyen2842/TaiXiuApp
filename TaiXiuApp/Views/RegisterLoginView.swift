//
//  RegisterLoginView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import SwiftUI

struct RegisterLoginView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players:PlayerModel = PlayerModel()
    @State private var playerLoggin:Player = Player(id: 0, username: "", password: "", HighScore: 0, UserMoney: 0)
    @State private var LoginPassword: String = ""
    @State private var LoginUserName: String = ""
    @State private var RegisterUser: String = ""
    @State private var RegisterPassword: String = ""
    @State private var isRegistered: Bool = false
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var hasAccount = false
    
    //username/ password --> check 2 thg nay de lay dc cai index cua thg currentPlayer nay trong players.players --> index = 1
    
    @State var currentPlayerIndex = -1
//    players.players[currentPlayerId]
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack() {
                  Form {
                    Section(header: Text("Login")) {
                        
                        HStack (spacing: 0) {
                            Text("Username: ")
                            Spacer()
                            TextField("Username", text: $LoginUserName)
                                .frame(width: 160)
                        }
                        
                        HStack (spacing: 0) {
                            Text("Passwod")
                            Spacer()
                            TextField("Password", text: $LoginPassword)
                                .frame(width: 160)
                        }
                        
                    Button("Login") {
                        autheticateUser(username: LoginUserName, password: LoginPassword)
                        savePlayers()
                        }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .navigationDestination(isPresented: $hasAccount){
                        MainMenuView(currentPlayerIndex: $currentPlayerIndex)
                        }
                    }
                      
                  Section(header: Text("Register")) {
                      HStack (spacing: 0) {
                          Text("Username: ")
                          Spacer()
                          TextField("Username", text: $RegisterUser)
                              .frame(width: 160)
                      }
                      
                      HStack (spacing: 0) {
                          Text("Passwod")
                          Spacer()
                          TextField("Password", text: $RegisterPassword)
                              .frame(width: 160)
                      }
                      
                      Button(action: {
                                  // Handle the login action here
                                  // You can add your login logic, e.g., checking credentials, navigating to the next screen, etc.
                          AddUser(username: RegisterUser, password: RegisterPassword)
                            
                              }) {
                                  Text("Register")
                                      .frame(maxWidth: .infinity)
                                      .padding()
                                      .background(Color.blue)
                                      .foregroundColor(.white)
                                      .cornerRadius(8)
                              }
                  }
                      Section(header: Text("Application Information")) {
                          HStack {
                            Text("App Name")
                            Spacer()
                            Text("RMIT Casino")
                          }
                          HStack {
                            Text("Course")
                            Spacer()
                            Text("COSC2659")
                          }
                          HStack {
                            Text("Year Published")
                            Spacer()
                            Text("2022")
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
            .onAppear{
            loadPlayers()
            }
        }
      
    }
    func autheticateUser(username: String, password: String){
        players.players.forEach { player in
            if (player.username == username && player.password == password) {
                hasAccount = true
                playerLoggin = player
                currentPlayerIndex = players.players.firstIndex(where: { p in
                    p.id == player.id
                })!
            }
        }
    }
    
    func AddUser(username: String, password: String){
        let NewPlayer = Player(id: players.players.count + 1, username: username, password: password, HighScore: 0, UserMoney: 0)
            players.players.append(NewPlayer)
            savePlayers()
    }
    
    func savePlayers() {
        do{
            let encodedPlayers = try JSONEncoder().encode(players.players)
            playerData = encodedPlayers
        } catch {
            print("Error Saving players: ")
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
//    func checkForAccount(login: String, password: String) -> Bool{
//            var hasAccount:Bool = false
//            players.players.forEach { player in
//                if (player.name == login && player.password == password) {
//                    hasAccount = true
//                    playerLoggin = player
//                }
//            }
//            return hasAccount
//        }
//        func addAccount(loginValue: String, passwordValue: String) {
//            var newPlayer = Player(id: players.players.count + 1, name: loginValue, password: passwordValue, scoreEasy: 50000, scoreIntermediate: 50000, scoreHard: 50000, maxWinStreak: 0, winStreak: 0, gameTotal: 0, winners: 0, losers: 0, achievements: [])
//            players.players.append(newPlayer)
//            savePlayers()
//        }

}


    

struct RegisterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLoginView()
    }
}
