# AR Stickers

![AppIcon](https://user-images.githubusercontent.com/66309582/171107556-ec97ca33-615d-4c78-97b3-85e66d1788db.png)

A minimal iOS AR (Augmented Reality) app that puts stickers in AR scene.

Using the app you can
- enter notes from the keyboard to create stickers
- place stickers in 360 degree 3d space around you
- move stickers with drag gestures

The app provides minimal UI and features to keep the code simple,
to clearly show the core logic.

The project;

- Xcode 13.4
- Target: iOS / iPadOS 15.0 and later
- Frameworks: SwiftUI, ARKit, RealityKit2, Core Graphics

It shows;

- drawing image textures using the Core Graphics framework
- assigning textures to geometries at runtime
- utilizing camera/device position and rotation
- coordination between SwiftUI Views and ARView

You can draw any shape by using the Core Graphics API
and use it as the image texture of the virtual object.

Please modify the project to make your own apps.
ARKit's world map save / load feature allows you to persist the state of a sticker in 3d space.
Or you can use RealityKit's synchronization feature to share stickers among multiple people.
I think it would be fun to add the image generated by the text-to-image AI to stickers.

![Image](https://user-images.githubusercontent.com/66309582/171107988-02406cd6-b625-41d8-9f70-ef15b011d82d.jpeg)
![GIF](https://user-images.githubusercontent.com/66309582/171107676-e5c69ea1-4bd6-4d86-b052-ac181cb75129.gif)

## References

- Apple Documentation: UIKit [UIGraphicsImageRenderer](https://developer.apple.com/documentation/uikit/uigraphicsimagerenderer/)
- HWS Article: [How to draw a square using Core Graphics: addRect()](https://www.hackingwithswift.com/example-code/core-graphics/how-to-draw-a-square-using-core-graphics-addrect)

![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)
