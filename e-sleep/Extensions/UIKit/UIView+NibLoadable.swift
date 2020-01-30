//
//  UIView+Loadable.swift
//  e-sleep
//
//  Created by Ren Matsushita on 2020/01/30.
//  Copyright © 2020 Ren Matsushita. All rights reserved.
//

import UIKit

extension UIView {
    class func create<T>() -> T where T: UIView {
        let nib = UINib(nibName: className(), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else { return T() }
        return view
    }
}
