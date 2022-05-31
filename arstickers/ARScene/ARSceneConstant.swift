//
//  ARSceneConstant.swift
//  arstickers
//
//  Created by Yasuhito Nagatomo on 2022/05/31.
//

import Foundation
import CoreGraphics
import UIKit

final class ARSceneConstant {
    private init() {}

    // AR World
    static let worldOriginForDevice: SIMD3<Float> = [0.0, 0.0, 0.0]
    static let worldOriginForMac: SIMD3<Float> = [0.0, 0.0, 0.0]

    // Model
    static let stickerSize = SIMD2<Float>(0.09, 0.06) // (width, height) [m]
    static let initialPosition = SIMD3<Float>(0, 0, -0.1) // (x, y, z)

    // Image Texture Drawing
    static let imageTextureSize = CGSize(width: 300, height: 200)
    static let margin = CGFloat(16)
    static let fontName = "HelveticaNeue-Thin"
    static let fontSize = CGFloat(36)
    static let fontColor = UIColor.white
}
