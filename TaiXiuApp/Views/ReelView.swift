//
//  ReelView.swift
//  TaiXiuApp
//
//  Created by Nguyen Giang Huy on 01/09/2023.
//

import SwiftUI

struct ReelView: View {
    var reelIcon: String
    var AnimatingIcon: Bool
    var body: some View {
        ZStack{
            Image("Goldreel")
                .resizable()
                .modifier(ReelImageModifier())
                .frame(width: 80, height: 80)
                Image(reelIcon)
                .resizable()
                .frame(width: 40, height: 40)
                .modifier(IconImageModifier())
                .opacity(AnimatingIcon ? 1: 0)
                .offset(y: AnimatingIcon ? 0: -50)
                .animation(.easeOut, value: AnimatingIcon)
        }
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView(reelIcon: "apple", AnimatingIcon: false)
            .previewLayout(.sizeThatFits)
    }
}
