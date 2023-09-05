//
//  RegisterLoginView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import SwiftUI

struct RegisterLoginView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isDrakMode") var isDark: Bool = false
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players:PlayerModel = PlayerModel()
    @State private var playerLoggin:Player = Player(id: 0, username: "", password: "", HighScore: 0, UserMoney: 0, BattleNum: 0, WinPercentage: 0, achievements: [], isBetAnyTriple: false, isBetOdd: false, isBetEven: false, isBetSmall: false, isBetBig: false, isBetDoubleOne: false, isBetDoubleTwo: false, isBetDoubleThree: false, isBetDoubleFour: false, isBetDoubleFive: false, isBetDoubleSix: false, isBetOne: false, isBetTwo: false, isBetThree: false, isBetFour: false, isBetFive: false, isBetSix: false, isBetOneTwo: false, isBetOneThree: false, isBetOneFour: false, isBetOneFive: false, isBetOneSix: false,isBetTwoSix: false,isBetFiveSix: false)
    @State private var LoginPassword: String = ""
    @State private var LoginUserName: String = ""
    @State private var RegisterUser: String = ""
    @State private var RegisterPassword: String = ""
    @State private var isRegistered: Bool = false
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var hasAccount = false
    @Binding var language: String
    // Add these states for controlling the alerts
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    //username/ password --> check 2 thg nay de lay dc cai index cua thg currentPlayer nay trong players.players --> index = 1
    
    @State var currentPlayerIndex = -1
    //    players.players[currentPlayerId]
    var body: some View {
        ZStack{
            NavigationStack {
                VStack() {
                    Form {
                        Section(header: Text("Login-string")) {
                            
                            HStack (spacing: 0) {
                                Text("user-string")
                                Spacer()
                                TextField("user-name-string", text: $LoginUserName)
                                    .frame(width: 160)
                            }
                            
                            HStack (spacing: 0) {
                                Text("password-string")
                                Spacer()
                                SecureField("user-password-string", text: $LoginPassword)
                                    .frame(width: 160)
                            }
                            
                            Button("login-button-string") {
                                autheticateUser(username: LoginUserName, password: LoginPassword)
                            }
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .navigationDestination(isPresented: $hasAccount){
                                MainMenuView(currentPlayerIndex: $currentPlayerIndex, gameLevel: 1, selectedLevel: 1, language: language)
                            }
                        }
                        
                        Section(header: Text("Register-string")) {
                            HStack (spacing: 0) {
                                Text("user-string")
                                Spacer()
                                TextField("user-name-string", text: $RegisterUser)
                                    .frame(width: 160)
                            }
                            
                            HStack (spacing: 0) {
                                Text("password-string")
                                Spacer()
                                SecureField("user-password-string", text: $RegisterPassword)
                                    .frame(width: 160)
                            }
                            
                            Button(action: {
                                // Handle the login action here
                                // You can add your login logic, e.g., checking credentials, navigating to the next screen, etc.
                                AddUser(username: RegisterUser, password: RegisterPassword)
                                
                            }) {
                                Text("register-button-string")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        Section(header: Text("Application-string")) {
                            HStack {
                                Text("AppName-string")
                                Spacer()
                                Text("Tai Xiu App")
                            }
                            HStack {
                                Text("Course-string")
                                Spacer()
                                Text("COSC2659")
                            }
                            HStack {
                                Text("YearPublised-string")
                                Spacer()
                                Text("2023")
                            }
                            HStack {
                                Text("Location-string")
                                Spacer()
                                Text("Saigon-string")
                            }
                        }
                    }
                    .font(.system(.body, design: .rounded))
                }
            }
            .onAppear(perform: {
                playSound(sound: "drum-music", type: "mp3")
                loadPlayers()
            })
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.locale, Locale.init(identifier: language))
        .environment(\.colorScheme, isDark ? .dark : .light)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
        
        
        func autheticateUser(username: String, password: String){
            var foundAccount = false
            players.players.enumerated().forEach { index, player in
                if (player.username == username && player.password == password) {
                    hasAccount = true
                    playerLoggin = player
                    currentPlayerIndex = index
                    foundAccount = true
                    alertTitle = "Success"
                }
            }
            
            // Show the alert if the account is not found
            if !foundAccount {
                alertTitle = "Error"
                alertMessage = "Invalid username or password!"
                showAlert = true
            }
        }
        
        func AddUser(username: String, password: String){
            let existingPlayer = players.players.first(where: { $0.username == username })
            guard existingPlayer == nil else {
                print("User already exists")
                return
            }
            let NewPlayer = Player(id: players.players.count + 1, username: username, password: password, HighScore: 0, UserMoney: 300, BattleNum: 0, WinPercentage: 0, achievements: [], isBetAnyTriple: false, isBetOdd: false, isBetEven: false, isBetSmall: false, isBetBig: false, isBetDoubleOne: false, isBetDoubleTwo: false, isBetDoubleThree: false, isBetDoubleFour: false, isBetDoubleFive: false, isBetDoubleSix: false, isBetOne: false, isBetTwo: false, isBetThree: false, isBetFour: false, isBetFive: false, isBetSix: false, isBetOneTwo: false, isBetOneThree: false, isBetOneFour: false, isBetOneFive: false, isBetOneSix: false,isBetTwoSix: false,isBetFiveSix: false)
                players.players.append(NewPlayer)
                savePlayers()
                
            if existingPlayer != nil {
                alertTitle = "Error"
                alertMessage = "User already exists"
                showAlert = true
            } else {
                alertTitle = "Success"
                alertMessage = "User registered successfully!"
                showAlert = true
            }
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
        RegisterLoginView(language: .constant("vi"))
    }
}
