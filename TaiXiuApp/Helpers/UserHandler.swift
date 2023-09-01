//
//  UserHandler.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import Foundation

final class UserHandler: ObservableObject{
    @Published var isChooseBetSmall = false
    @Published var isChooseBetBig = false
    
    // MARK: - BET Small LOGIC
    func chooseBetSmall() {
        isChooseBetSmall.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
    
    // MARK: - BET Big LOGIC
    func chooseBetBig() {
        isChooseBetBig.toggle()
        playSound(sound: "bet-chip", type: "mp3")
    }
}
