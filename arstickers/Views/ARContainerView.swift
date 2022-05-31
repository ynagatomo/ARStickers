//
//  ARContainerView.swift
//  arstickers
//
//  Created by Yasuhito Nagatomo on 2022/05/31.
//

import SwiftUI

struct ARContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = ARViewController
    let sticker: Sticker // will be re-evaluated with the latest value

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIViewController(context: Context) -> ARViewController {
        return ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewController,
                                context: Context) {
        // The initial camera's translation is unstable
        // when AR session starts.
        guard sticker.note != "" else { return }
        uiViewController.add(sticker: sticker)
    }

    class Coordinator: NSObject {
        var parent: ARContainerView
        init(_ parent: ARContainerView) {
            self.parent = parent
        }
    }
}
