//
//  PaddingTextField.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

public class PaddingTextField: UITextField {

    internal var padding: UIEdgeInsets = .zero

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        var padding = self.padding
        if leftView != nil {
            padding.left += (leftView?.bounds.width ?? 0)
        }
        if rightView != nil {
            padding.right += (rightView?.bounds.width ?? 0)
        }
        return bounds.inset(by: padding)
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        var padding = self.padding
        if leftView != nil {
            padding.left += (leftView?.bounds.width ?? 0)
        }
        if rightView != nil {
            padding.right += (rightView?.bounds.width ?? 0)
        }
        return bounds.inset(by: padding)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        var padding = self.padding
        if leftView != nil {
            padding.left += (leftView?.bounds.width ?? 0)
        }
        if rightView != nil {
            padding.right += (rightView?.bounds.width ?? 0)
        }
        return bounds.inset(by: padding)
    }

    public override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.leftViewRect(forBounds: bounds)
        newBounds.origin.x += padding.left
        return newBounds
    }

    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.rightViewRect(forBounds: bounds)
        newBounds.origin.x -= padding.right
        return newBounds
    }

    public func set(padding: UIEdgeInsets) {
        self.padding = padding
    }

}
