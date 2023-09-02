//
//  PlayerModel.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import Foundation

class PlayerModel: ObservableObject {
    @Published var players: [Player] = []
}
