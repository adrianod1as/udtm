//
//  FormTextField.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import SwiftRichString
import UIGradient
import IQKeyboardManagerSwift

// swiftlint:disable type_body_length
public class UDTFormTextField: PaddingTextField {

    // MARK: - Fonts
    public var titleFont: UIFont = FontFamily.Rubik.regular.font(size: 18) {
        didSet {
            titleLabel.font = titleFont
        }
    }

    public var helperFont: UIFont = FontFamily.Rubik.regular.font(size: 16) {
        didSet {
            helperLabel.font = helperFont
        }
    }

    public var placeholderFont: UIFont = FontFamily.Rubik.regular.font(size: 18) {
        didSet {
            setupPlaceholder()
        }
    }

    public var textFont: UIFont = FontFamily.Rubik.regular.font(size: 20) {
        didSet {
            font = textFont
        }
    }

    // MARK: - Colors
    public var titleColor: UIColor = ColorName.white {
        didSet {
            titleLabel.textColor = titleColor
        }
    }

    public var helperColor: UIColor = ColorName.white {
        didSet {
            helperLabel.textColor = helperColor
        }
    }

    public var txtColor: UIColor = ColorName.white {
        didSet {
            textColor = txtColor
        }
    }

    public var placeholderColor: UIColor = ColorName.graySuit {
        didSet {
            setupPlaceholder()
        }
    }

    public var disabledPlaceholderColor: UIColor = ColorName.graySuit {
        didSet {
            setupPlaceholder()
        }
    }

    public var txtTintColor: UIColor = ColorName.electricPurple {
        didSet {
            setupTintColor()
        }
    }

    public var primaryBorderColor: UIColor = ColorName.electricViolet {
        didSet {
            setupTextFieldBorder()
        }
    }

    public var secondaryBorderColor: UIColor? = ColorName.electricViolet {
        didSet {
            setupTextFieldBorder()
        }
    }

    public var gradientBorderDirection: GradientDirection = .topLeftToBottomRight {
        didSet {
            setupTextFieldBorder()
        }
    }

    public var unfocusedBorderColor: UIColor = ColorName.white {
        didSet {
            setupTextFieldBorder()
        }
    }

    public var disabledBorderColor: UIColor = ColorName.graySuit {
        didSet {
            setupTextFieldBorder()
        }
    }

    public var udtBackgroundColor: UIColor = .clear {
        didSet {
            setupBackgroundColor()
        }
    }

    public var disabledBackgroundColor: UIColor = ColorName.graySuit {
        didSet {
            setupBackgroundColor()
        }
    }

    public var errorColor: UIColor = ColorName.red

    // MARK: - Lenghts
    public var udtPadding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) {
        didSet {
            set(padding: udtPadding)
        }
    }

    public var txtBorderWidht: CGFloat = 1 {
        didSet {
            backgroundView.layer.borderWidth = txtBorderWidht
        }
    }

    public var txtCornerRadius: CGFloat = 16 {
        didSet {
            backgroundView.layer.cornerRadius = txtCornerRadius
        }
    }

    public func extraHeight() -> CGFloat {
        let height = titleHeight() + errorHeight()
        return height
    }

    public func errorHeight() -> CGFloat {
        return helperLabelRectForBounds(bounds).size.height
    }

    public func titleHeight() -> CGFloat {
        return titleLabelRectForBounds(bounds).size.height
    }

    private func titleLabelRectForBounds(_ bounds: CGRect) -> CGRect {
        guard !title.isEmpty else {
            return .zero
        }
        let height = title.height(withConstrainedWidth: bounds.size.width, font: titleLabel.font)
        return CGRect(x: 0, y: 0, width: bounds.size.width, height: height)
    }

    private func helperLabelRectForBounds(_ bounds: CGRect) -> CGRect {
        guard !(error ?? "").isEmpty || !helper.isEmpty else {
            return .zero
        }
        let height = (isError ? (error ?? "") : helper).height(withConstrainedWidth: bounds.size.width, font: helperLabel.font)
        return CGRect(x: 0, y: bounds.size.height - height, width: bounds.size.width, height: height + 4)
    }

    // MARK: - Content
    public override var placeholder: String? {
        didSet {
            setupPlaceholder()
        }
    }

    public var placeholderWithAttributes: NSAttributedString? {
        didSet {
            setupPlaceholder()
        }
    }

    public var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }

    public var helper: String = "" {
        didSet {
            helperLabel.text = helper
        }
    }

    public var btnTitle: String? = nil {
        didSet {
            btnAction.setTitle(btnTitle, for: .init())
        }
    }

    public var btnImage: UIImage? = nil {
        didSet {
            btnAction.setImage(btnImage, for: .init())
        }
    }

    public enum Side {
        case left
        case right
    }

    // MARK: - Layout
    @objc private func updateLayout() {
        setupPlaceholder()
        setupTextFieldBorder()
        setupBackgroundColor()
        setupTintColor()
    }

    func setupPlaceholder() {
        if let attributedPlaceholder = placeholderWithAttributes {
            self.attributedPlaceholder = attributedPlaceholder
        } else {
            let style =  Style {
                $0.font = self.placeholderFont
                $0.color = self.isEnabledState ? self.placeholderColor : self.disabledPlaceholderColor
            }
            attributedPlaceholder = placeholder?.set(style: style)
        }
    }

    private func setupBackgroundColor() {
        backgroundView.backgroundColor = isEnabledState ? udtBackgroundColor : disabledBackgroundColor
    }

    private func setupTextFieldBorder() {
        backgroundView.layer.borderWidth = txtBorderWidht
        backgroundView.layer.cornerRadius = txtCornerRadius
        backgroundView.layer.cornerRadius = txtCornerRadius
        if !isEnabledState {
            backgroundView.layer.borderColor = disabledBorderColor.cgColor
            btnAction.tintColor = disabledBorderColor
        } else if isError {
            backgroundView.layer.borderColor = errorColor.cgColor
            btnAction.tintColor = errorColor
        } else if isFirstResponder || (formType == .dropbox && !(text ?? "").isEmpty) {
            if let secondaryColor = secondaryBorderColor {
                backgroundView.layer.borderColor = UIColor
                                                    .fromGradientWithDirection(gradientBorderDirection, frame: bounds,
                                                                               colors: [primaryBorderColor, secondaryColor])?
                                                    .cgColor
            } else {
                backgroundView.layer.borderColor = primaryBorderColor.cgColor
            }
            btnAction.tintColor = primaryBorderColor
        } else if !isFirstResponder {
            backgroundView.layer.borderColor = unfocusedBorderColor.cgColor
            btnAction.tintColor = unfocusedBorderColor
        }
    }

    private func setupTintColor() {
        if isError {
            tintColor = errorColor
        } else if formType == .dropbox {
            tintColor = .clear
        } else {
            tintColor = txtTintColor
        }
    }

    public func setupActionButton(side: Side = .right) {
        actionButtonside = side
        rightView = btnAction
        rightView = actionButtonside == .right ? btnAction : nil
        rightViewMode = actionButtonside == .right ? .always : .never
        leftView = actionButtonside == .left ? btnAction : nil
        leftViewMode = actionButtonside == .left ? .always : .never

    }

    public func setupTapGesture() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    // MARK: - State & Interaction
    private var actionButtonside: Side = .right

    public func isPlaceholder(_ text: String) -> Bool {
        return (textColor == placeholderColor || textColor == disabledPlaceholderColor)  && (!text.isEmpty || text == placeholder)
    }

    public var isEnabledState: Bool = true {
        didSet {
            isEnabled = isEnabledState
            isUserInteractionEnabled = isEnabled
            if !isEnabled {
                text = nil
            }
            setupTextFieldBorder()
            setupPlaceholder()
            setupBackgroundColor()
        }
    }

    public var didBackspaced: ((String) -> Void)?
    public var textChanged: ((String?) -> Void)?
    public var actionTriggered: (() -> Void)?
    public var tapped: (() -> Void)?
    public var becameFirstResponder: (() -> Void)?
    public var resignedFirstResponder: (() -> Void)?

    private var error: String? = nil {
        didSet {
            updateLayout()
            isError = error != nil && !(error?.isEmpty)!
            invalidateIntrinsicContentSize()
            helperLabel.text = isError ? error : helper
            helperLabel.sizeToFit()
            invalidateIntrinsicContentSize()
        }
    }

    public var isError: Bool = false {
        didSet {
            setupTintColor()
            helperLabel.textColor = isError ? errorColor : helperColor
            setupTextFieldBorder()
            setupPlaceholder()
        }
    }

    private var isDefaultRect: Bool {
        return title.isEmpty && helper.isEmpty && (error ?? "").isEmpty
    }

    public enum FormType {
        case standard
        case dropbox
        case user
    }

    public var formType: FormType = .standard {
        didSet {
            setupTintColor()
        }
    }

    public func set(error: String?) {
        self.error = error
    }

    @objc func triggerAction() {
        actionTriggered?()
    }

    @objc func tap() {
        tapped?()
    }

    @objc private func focusOnInput() {
        _ = becomeFirstResponder()
    }

    // MARK: - Subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()

    private lazy var helperLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .clear
        return label
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(focusOnInput)))
        return view
    }()

    private lazy var btnAction: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 48))
        button.addTarget(self, action: #selector(triggerAction), for: .touchUpInside)
        return button
    }()

    private func setupView() {
        font = textFont
        set(padding: udtPadding)
        keyboardAppearance = .dark
        addSubview(titleLabel)
        addSubview(helperLabel)
        addSubview(backgroundView)
        sendSubviewToBack(backgroundView)
        backgroundColor = .clear
        borderStyle = .none
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        updateLayout()
    }

    // MARK: - Init & Overrides
    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupView()
    }

    override public func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        updateLayout()
        becameFirstResponder?()
        return result
    }

    override public func resignFirstResponder() -> Bool {
        let result =  super.resignFirstResponder()
        updateLayout()
        resignedFirstResponder?()
        return result
    }

    public override func awakeFromNib() {
        super.awakeFromNib()

        font = textFont
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = titleLabelRectForBounds(bounds)
        helperLabel.frame = helperLabelRectForBounds(bounds)
        rightView?.frame = rightViewRect(forBounds: bounds)
        leftView?.frame = leftViewRect(forBounds: bounds)
        let frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            .inset(by: UIEdgeInsets(top: titleHeight() + 4, left: 0, bottom: errorHeight(), right: 0))
        backgroundView.frame = frame
    }

    private var fontHeight: CGFloat {
        return ceil(font?.lineHeight ?? 24)
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        isSelected = true
        updateLayout()
        invalidateIntrinsicContentSize()
    }

    override open var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        let height = titleHeight() + max(48, super.intrinsicContentSize.height) + errorHeight()
        return CGSize(width: super.intrinsicContentSize.width, height: height)
    }

    private func updated(bounds: CGRect) -> CGRect {
        let helperHeight = errorHeight()
        let titleHeight  = self.titleHeight()
        let top: CGFloat
        if !title.isEmpty && !(helper.isEmpty && (error ?? "").isEmpty) {
            let aligningPad = (titleHeight - helperHeight) / 2
            top = bounds.origin.y + padding.top + aligningPad
        } else {
            top = (title.isEmpty ? -(helperHeight / 2) : titleHeight / 2) + padding.top
        }
        let rect = CGRect(x: bounds.origin.x + padding.left + (leftView?.bounds.height ?? 0), y: top,
                          width: bounds.width - (padding.right * 2) - (rightView?.bounds.width ?? 0),
                          height: bounds.height - padding.bottom)
        return rect
    }

    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        guard !isDefaultRect else {
            return super.textRect(forBounds: bounds)
        }
        return updated(bounds: bounds)
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        guard !isDefaultRect else {
            return super.placeholderRect(forBounds: bounds)
        }
        return updated(bounds: bounds)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        guard !isDefaultRect else {
            return super.editingRect(forBounds: bounds)
        }
        return updated(bounds: bounds)
    }

    override public func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        return CGRect(x: rect.origin.x, y: titleHeight(), width: rect.width, height: 48)
    }

    override public func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return CGRect(x: rect.origin.x, y: titleHeight(), width: rect.width, height: 48)
    }

    @objc func editingChanged() {
        setupTextFieldBorder()
        setupBackgroundColor()
        textChanged?(text)
        error = nil
        updateLayout()
    }

}
