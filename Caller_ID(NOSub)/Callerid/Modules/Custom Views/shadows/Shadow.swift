//
//  Shadow.swift
//  Callerid
//
//  Created by Владимир Клевцов on 19.3.24..
//

import UIKit

extension UIView {
    func addShadow(shadowColor: CGColor, shadowOffset: CGSize, shadowRadius: CGFloat, shadowOpacity: Float) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
    }
}
