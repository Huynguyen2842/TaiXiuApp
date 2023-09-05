import SwiftUI

struct SettingView: View {
    @AppStorage("isDrakMode") private var isDark = false
    @State private var isLoggedIn: Bool = true
    @Binding var gameLevel: Int
    @Binding var selectedLevel: Int
    @Binding var language: String
    @Binding var currentPlayerIndex: Int
    @AppStorage("players") private var playerData: Data = Data()
    @StateObject private var players: PlayerModel = PlayerModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if isLoggedIn {
            NavigationView {
                Form {
                    Section(header: Text("user-info-string").font(.headline)) {
                        HStack {
                            Label("user-string", systemImage: "person.crop.circle")
                            Text("\(currentPlayerIndex >= 0 && currentPlayerIndex < players.players.count ? players.players[currentPlayerIndex].username : "Unknown")")
                        }
                    }
                    
                    Section(header: Text("language-string").font(.headline)) {
                        Picker("Select Language", selection: $language) {
                            Text("vietnamese-string").tag("vi")
                            Text("english-string").tag("en")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("level-string").font(.headline)){
                        Picker("Select Level", selection: $selectedLevel) {
                            Text("easy-mode-string").tag(1)
                            Text("medium-mode-string").tag(2)
                            Text("hard-mode-string").tag(3)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section {
                        Button(action: {
                            currentPlayerIndex = -1
                            isLoggedIn = false
                        }) {
                            Text("log-out-string")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationBarTitle("setting-string", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isDark.toggle()
                        }) {
                            isDark ? Label("Dark", systemImage: "sun.max.fill") : Label("Dark", systemImage: "moon.fill")
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Label("close-string", systemImage: "xmark.circle.fill")
                        }
                    }
                }
            }
            .onAppear{
                loadPlayers()
            }
            .navigationBarHidden(true)
            .environment(\.locale, Locale.init(identifier: language))
            .environment(\.colorScheme, isDark ? .dark : .light)
        } else {
            RegisterLoginView(language: $language)
                .navigationBarBackButtonHidden(true)
        }
    }
    
    func loadPlayers() {
        do {
            let decodedPlayers = try JSONDecoder().decode([Player].self, from: playerData)
            players.players = decodedPlayers
        } catch {
            print("Error Loading Players")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(gameLevel: .constant(1), selectedLevel: .constant(1), language: .constant("vi"), currentPlayerIndex: .constant(-1))
    }
}
