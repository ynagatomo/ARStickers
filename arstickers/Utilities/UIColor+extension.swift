//
//  UIColor+extension.swift
//  arstickers
//
//  Created by Yasuhito Nagatomo on 2022/05/31.
//

import UIKit

extension UIColor {
    static func randomColor(saturation: CGFloat = 0.6, brightness: CGFloat = 0.4, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(hue: CGFloat.random(in: 0.0...1.0),
                       saturation: saturation,
                       brightness: brightness,
                       alpha: alpha)
    }
}
