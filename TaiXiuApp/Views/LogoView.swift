//
//  LogoView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 01/09/2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("rmit-casino-welcome-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .modifier(ShadowModifiers())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
    }
}
