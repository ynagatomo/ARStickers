//
//  HomeView.swift
//  arstickers
//
//  Created by Yasuhito Nagatomo on 2022/05/31.
//

import SwiftUI

struct HomeView: View {
    @State private var sticker = Sticker(note: "")
    private let panelSize = ViewConstant.panelSize
    var body: some View {
        ZStack {
            ARContainerView(sticker: sticker)
            VStack {
                Text(sticker.note)
                    .padding(.top, 48)
                    .foregroundColor(.green)
                    .font(.title)
                Spacer()
            } // VStack
        } // ZStack
        .ignoresSafeArea()
        .overlay {
            GeometryReader { geo in
                InputPanelView(resultText: $sticker.note, panelSize: panelSize)
                    .offset(x: (geo.size.width - panelSize.width) / 2,
                            y: (geo.size.height - panelSize.height) - 40)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().ignoresSafeArea()
    }
}
