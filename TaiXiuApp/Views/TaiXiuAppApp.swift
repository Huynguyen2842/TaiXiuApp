//
//  TaiXiuAppApp.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 30/08/2023.
//

import SwiftUI

@main
struct TaiXiuAppApp: App {
    @State private var language = "en" // default value
    var body: some Scene {
        WindowGroup {
            RegisterLoginView(language: $language)
        }
    }
}
