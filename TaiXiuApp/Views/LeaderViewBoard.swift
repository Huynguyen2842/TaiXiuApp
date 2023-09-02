//
//  LeaderViewBoard.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 02/09/2023.
//

import SwiftUI

struct LeaderViewBoard: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        LogoView()
        Button {
            dismiss()
        } label: {
            Text("Click me to Dismiss Me!")
        }

    }
}

struct LeaderViewBoard_Previews: PreviewProvider {
    static var previews: some View {
        LeaderViewBoard()
    }
}
