//
//  UIColor+Ext.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIGradient

public extension UIColor {

    func alpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }

    class func purpleGradient(forFrame frame: CGRect) -> UIColor? {
        return UIColor.fromGradientWithDirection(.topLeftToBottomRight,
                                                 frame: frame,
                                                 colors: [ColorName.electricPurple, ColorName.electricViolet])
    }

    class func whiteGradient(forFrame frame: CGRect) -> UIColor? {
        return UIColor.fromGradientWithDirection(.bottomToTop,
                                                 frame: frame,
                                                 colors: [ColorName.white, ColorName.white.withAlphaComponent(0)])
    }
}
