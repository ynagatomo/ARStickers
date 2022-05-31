//
//  InputPanelView.swift
//  arstickers
//
//  Created by Yasuhito Nagatomo on 2022/05/31.
//

import SwiftUI

struct InputPanelView: View {
    @State private var inputText: String = ""
    @Binding var resultText: String
    let panelSize: CGSize
    var body: some View {
        VStack {
            Text("Enter a sticker note.")
                .font(.title2)
                .foregroundColor(.white)

            TextField("any text", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    resultText = inputText
                    inputText = ""
                }
                .padding(.horizontal)
        }
        .frame(width: panelSize.width, height: panelSize.height)
        .background(.gray, in: RoundedRectangle(cornerRadius: 20))
    }
}

struct InputPanelView_Previews: PreviewProvider {
    @State static var text: String = "sample"
    static var previews: some View {
        InputPanelView(resultText: $text, panelSize: ViewConstant.panelSize)
    }
}
