//
//  BackGroungGradient.swift
//  Callerid
//
//  Created by Владимир Клевцов on 18.3.24..
//

import UIKit

extension UIView {
    func addGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        if let existingLayers = layer.sublayers?.filter({ $0 is CAGradientLayer }) {
            for layer in existingLayers {
                layer.removeFromSuperlayer()
            }
        }
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

