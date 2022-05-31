//
//  ARScene.swift
//  arstickers
//
//  Created by Yasuhito Nagatomo on 2022/05/31.
//

import UIKit
import RealityKit
import Combine

final class ARScene {
    private var anchor: AnchorEntity!
    private var arView: ARView!

    init(arView: ARView, anchor: AnchorEntity) {
        self.anchor = anchor
        self.arView = arView
    }

    func startSession() {
        startAnimation()
    }

    func stopSession() {
        stopAnimation()
    }

    private func startAnimation() {
        // do nothing
    }

    private func stopAnimation() {
        // do nothing
    }
}

extension ARScene {
    // Add a sticker in the AR scene
    func add(sticker: Sticker) {
        // generates a geometry for the sticker
        let mesh = MeshResource.generatePlane(width: ARSceneConstant.stickerSize.x,
                                              height: ARSceneConstant.stickerSize.y)
        var material = UnlitMaterial()
        if let imageTexture = drawImageTexture(text: sticker.note).cgImage {
            // generates a color image texture and assigns it to the material
            if let textureResource = try? TextureResource.generate(from: imageTexture,
                                options: TextureResource.CreateOptions(semantic: .color)) {
                material.color.texture = PhysicallyBasedMaterial.Texture(textureResource)
            }
        }

        // generates a model
        let model = ModelEntity(mesh: mesh, materials: [material])

        // places the model according to the camera/device position and rotation
        let cameraOrientation = arView.cameraTransform.rotation
        model.orientation = cameraOrientation
        let cameraPosition = arView.cameraTransform.translation
        let offsetVect = simd_act(cameraOrientation, ARSceneConstant.initialPosition)
        model.transform.translation = cameraPosition + offsetVect
        model.scale = SIMD3<Float>(0.1, 0.1, 0.1)

        #if !targetEnvironment(simulator)
        // installs gestures to the ModelEntity
        model.generateCollisionShapes(recursive: false)
        arView.installGestures(.all, for: model)
        #endif

        anchor.addChild(model)

        // starts an animation
        let endTransform = Transform(scale: SIMD3<Float>(1, 1, 1),  // do animation
                                     rotation: model.orientation,   // no animation
                                     translation: model.transform.translation) // no animation
        model.move(to: endTransform, relativeTo: nil, duration: 1) // 1 [sec]
    }

    // Draw an image texture
    func drawImageTexture(text: String) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: ARSceneConstant.imageTextureSize)
        let image = renderer.image { context in
            // inside
            UIColor.randomColor().setFill()
            context.fill(renderer.format.bounds)
            // frame
            UIColor.white.setStroke()
            context.stroke(renderer.format.bounds)
            // text
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let attributes = [
                NSAttributedString.Key.font: UIFont(name: ARSceneConstant.fontName,
                                                    size: ARSceneConstant.fontSize)!,
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.foregroundColor: ARSceneConstant.fontColor ]
            text.draw(with: CGRect(x: ARSceneConstant.margin,
                                   y: ARSceneConstant.margin,
                                   width: ARSceneConstant.imageTextureSize.width
                                        - ARSceneConstant.margin * 2,
                                   height: ARSceneConstant.imageTextureSize.height
                                        - ARSceneConstant.margin * 2),
                        options: .usesLineFragmentOrigin,
                        attributes: attributes,
                        context: nil)
        }
        return image
    }
}
