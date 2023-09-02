//
//  PlayersData.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import Foundation

struct Player: Codable {
    var id: Int
    var username: String
    var password: String
    var HighScore: Int
    var UserMoney: Int
}
