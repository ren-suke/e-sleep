//
//  UITextFieldDesinable.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2019/11/11.
//  Copyright © 2019 Ren Matsushita. All rights reserved.
//

import UIKit

@IBDesignable
final class PaddingTextField: UITextField {
  
    @IBInspectable var padding: CGPoint = CGPoint(x: 6.0, y: 0.0)

    // MARK: Internal Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: self.padding.x, dy: self.padding.y)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: self.padding.x, dy: self.padding.y)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: self.padding.x, dy: self.padding.y)
    }
}
