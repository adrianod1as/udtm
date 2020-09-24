//
//  UDTButton.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

open class UDTButton: UIButton {

    public var action: (() -> Void)?

    public var btnBackgrounColor: UIColor = .white {
        didSet {
            setBackground()
        }
    }

    public var btnBorderColor: UIColor = .clear {
        didSet {
            setBorderColor()
        }
    }

    public var disabledBackgrounColor: UIColor = .gray {
        didSet {
            setBackground()
        }
    }

    public var disabledBorderColor: UIColor = .clear {
        didSet {
            setBorderColor()
        }
    }

    public var btnBorderWidth: CGFloat = 2 {
        didSet {
            setBorderWidth()
        }
    }

    public var btnCornerRadius: CGFloat? = nil {
        didSet {
            layer.cornerRadius = btnCornerRadius ?? bounds.size.width * (16 / 256)
            layer.masksToBounds = false
        }
    }

    public var title: String = "" {
        didSet {
            setTitle()
        }
    }

    public var attributedTitle: NSAttributedString? = nil {
        didSet {
            setTitle()
        }
    }

    public var titleColor: UIColor = .white {
        didSet {

        }
    }

    public var disabledTitleColor: UIColor = .white {
        didSet {

        }
    }

    public var isEnabledState: Bool = true {
        didSet {
            isEnabled = isEnabledState
            isUserInteractionEnabled = isEnabledState
            setupLayout()
        }
    }

    public var txtTitleLabelFont: UIFont = FontFamily.Rubik.regular.font(size: 20) {
        didSet {

        }
    }

    public var rawUDTButtonType: Int = -1 {
        didSet {
            udtButtonType = UDTButtonType(rawValue: rawUDTButtonType)
        }
    }

    public var udtButtonType: UDTButtonType? {
        didSet {
            setupLayout()
        }
    }

    private func setBackground() {
        guard let udtButtonType = udtButtonType else {
            backgroundColor = isEnabledState ? btnBackgrounColor : disabledBackgrounColor
            return
        }
        backgroundColor = udtButtonType.backgroundColor(isEnabled: isEnabledState, frame: bounds)
    }

    private func setBorderColor() {
        guard let udtButtonType = udtButtonType else {
            let color = isEnabledState ? btnBorderColor : disabledBorderColor
            layer.borderColor = color.cgColor
            return
        }
        layer.borderColor = udtButtonType.borderColor(isEnabled: isEnabledState, frame: bounds)
    }

    private func setTitleColor() {
        guard let udtButtonType = udtButtonType else {
            setTitleColor(isEnabledState ? titleColor : disabledTitleColor, for: .init())
            return
        }
        setTitleColor(udtButtonType.titleColor(isEnabled: isEnabledState), for: .init())
    }

    private func setBorderWidth() {
        guard let udtButtonType = udtButtonType else {
            layer.borderWidth = btnBorderWidth
            return
        }
        layer.borderWidth = udtButtonType.borderWidth
    }

    private func setTitle() {
        guard let attributedTitle = self.attributedTitle else {
            setTitle(title, for: .init())
            return
        }
        setAttributedTitle(attributedTitle, for: .init())
    }

    private func setupButton() {
        addTarget(self, action: #selector(triggerAction), for: .touchUpInside)
        layer.masksToBounds = false
    }

    private func setupLayout() {
        layer.cornerRadius = btnCornerRadius ?? bounds.size.width * (16 / 256)
        setBorderColor()
        setBackground()
        setBorderWidth()
        guard attributedTitle == nil else {
            return
        }
        titleLabel?.font = txtTitleLabelFont
        setTitleColor()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()

        setupButton()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupButton()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)

        setupButton()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()

        setupLayout()
    }

    @objc func triggerAction() {
        action?()
    }

}

public enum UDTButtonType: Int {
    case gradientFilled = 0, whiteFilled, gradientBordered, whiteBordered

    var backgrounColor: UIColor {
        switch self {
        case .gradientFilled:
            return ColorName.electricPurple
        case .whiteFilled:
            return .white
        case .whiteBordered, .gradientBordered:
            return .clear
        }
    }

    var disabledBackgrounColor: UIColor {
        switch self {
        case .gradientFilled:
            return ColorName.lightGray
        case .whiteBordered, .whiteFilled:
            return UIColor.white.withAlphaComponent(0.4)
        case .gradientBordered:
            return .white
        }
    }

    var borderColor: UIColor {
        switch self {
        case .gradientFilled, .whiteFilled:
            return .clear
        case .gradientBordered:
            return ColorName.electricViolet
        case .whiteBordered:
            return .white
        }
    }

    var disabledBorderColor: UIColor {
        switch self {
        case .whiteBordered:
            return UIColor.white.withAlphaComponent(0.4)
        case .whiteFilled, .gradientFilled:
            return .clear
        case .gradientBordered:
            return ColorName.graySuit
        }
    }

    var titleColor: UIColor {
        switch self {
        case .gradientFilled, .whiteBordered:
            return ColorName.white
        case .whiteFilled, .gradientBordered:
            return ColorName.electricViolet
        }
    }

    var disabledTitleColor: UIColor {
        switch self {
        case .gradientFilled:
            return .white
        case .whiteBordered:
            return UIColor.white.withAlphaComponent(0.4)
        case .whiteFilled:
            return ColorName.electricViolet.withAlphaComponent(0.4)
        case .gradientBordered:
            return ColorName.graySuit
        }
    }

    var isBordered: Bool {
        return self == .gradientBordered || self == .whiteBordered
    }

    var borderWidth: CGFloat {
        return isBordered ? 2 : 0
    }

    func backgroundColor(isEnabled: Bool, frame: CGRect) -> UIColor? {
        guard isEnabled else {
            return disabledBackgrounColor
        }
        return self == .gradientFilled ? UIColor.purpleGradient(forFrame: frame) : backgrounColor
    }

    func borderColor(isEnabled: Bool, frame: CGRect) -> CGColor? {
        guard isEnabled else {
            return disabledBorderColor.cgColor
        }
        let color = self == .gradientBordered ? UIColor.purpleGradient(forFrame: frame) : borderColor
        return color?.cgColor
    }

    func titleColor(isEnabled: Bool) -> UIColor {
        return isEnabled ? titleColor : disabledTitleColor
    }
}
