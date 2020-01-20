//
//  UITextFieldExtensions.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/11.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

extension UITextField {
    func addBorderBottom(height: CGFloat, color: UIColor) {
        let border: CALayer = CALayer()
        border.frame = CGRect(x: 0, y: self.bounds.height - height, width: self.bounds.width, height: height)
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}
