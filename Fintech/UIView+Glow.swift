//
//  UIView+Glow.swift
//  Fintech
//
//  Created by Gabriel Garcia Pimentel Mendonca on 21/08/23.
//

import UIKit

extension UIView {
    enum GlowEffect: Float {
        case small = 0.4, normal = 2, big = 15
    }

    func glowEffect(withColor color: UIColor, withEffect effect: GlowEffect = .normal) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 15
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
    }
}
