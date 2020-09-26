//
//  LoginView.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Common

protocol LoginViewDelegate: UITextFieldDelegate {

}

public class LoginView: UIView {

    lazy var imgLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = Asset.movie.image
        return imgView
    }()

    lazy var txtUsername: UDTFormTextField = {
        let field = UDTFormTextField()
        field.title = L10n.LoginView.Username.title
        field.placeholder = L10n.LoginView.Username.placeholder
        field.keyboardDistanceFromTextField = 16
        field.translatesAutoresizingMaskIntoConstraints = false
        field.keyboardType = .emailAddress
        field.autocorrectionType = .no
        return field
    }()

    lazy var txtPassword: UDTFormTextField = {
        let field = UDTFormTextField()
        field.title = L10n.LoginView.Password.title
        field.placeholder = L10n.LoginView.Password.placeholder
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isSecureTextEntry = true
        field.autocorrectionType = .no
        return field
    }()

    lazy var swtSavingSession: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.onTintColor = ColorName.electricViolet
        return view
    }()

    lazy var lblSavingSession: UILabel = {
        let label = UILabel()
        label.font = FontFamily.RubikMedium.regular.font(size: 14)
        label.text = L10n.LoginView.Switch.title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    lazy var btnLogin: UDTButton = {
        let button = UDTButton()
        button.udtButtonType = .gradientFilled
        button.setTitle(L10n.LoginView.Login.title, for: .init())
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var txtPasswordHeightAnchor: NSLayoutConstraint = {
        txtPassword.heightAnchor.constraint(greaterThanOrEqualToConstant: 48)
    }()

    private lazy var swtSavingSessionTopAnchor: NSLayoutConstraint = {
        swtSavingSession.topAnchor.constraint(equalTo: txtPassword.bottomAnchor, constant: 16)
    }()

    private lazy var btnLoginTopAnchor: NSLayoutConstraint = {
        btnLogin.topAnchor.constraint(equalTo: swtSavingSession.bottomAnchor, constant: 24)
    }()

    private lazy var btnLoginHeightAnchor: NSLayoutConstraint = {
        btnLogin.heightAnchor.constraint(equalTo: btnLogin.widthAnchor, multiplier: 0.18)
    }()

    weak var delegate: LoginViewDelegate? {
        didSet {
            txtUsername.delegate = delegate
            txtPassword.delegate = delegate
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func addSubviews() {
        addSubview(imgLogo)
        addSubview(txtUsername)
        addSubview(txtPassword)
        addSubview(lblSavingSession)
        addSubview(swtSavingSession)
        addSubview(btnLogin)
    }

    private func activateImgLogoConstraints() {
        imgLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        imgLogo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        imgLogo.heightAnchor.constraint(equalTo: imgLogo.widthAnchor).isActive = true
        imgLogo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func activateTxtUsernameConstraints() {
        txtUsername.topAnchor.constraint(equalTo: imgLogo.bottomAnchor, constant: 16).isActive = true
        txtUsername.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        txtUsername.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        txtUsername.heightAnchor.constraint(greaterThanOrEqualToConstant: 48).isActive = true
    }

    private func activateTxtPasswordConstraints() {
        txtPassword.topAnchor.constraint(equalTo: txtUsername.bottomAnchor, constant: 16).isActive = true
        txtPassword.rightAnchor.constraint(equalTo: txtUsername.rightAnchor).isActive = true
        txtPassword.leftAnchor.constraint(equalTo: txtUsername.leftAnchor).isActive = true
        txtPasswordHeightAnchor.isActive = true
    }

    private func activateSwitchSavingSessionConstraints() {
        swtSavingSessionTopAnchor.isActive = true
        swtSavingSession.leftAnchor.constraint(equalTo: txtPassword.leftAnchor).isActive = true
    }

    private func activateLblSavingSessionConstraints() {
        lblSavingSession.leftAnchor.constraint(equalTo: swtSavingSession.rightAnchor, constant: 8).isActive = true
        lblSavingSession.topAnchor.constraint(equalTo: swtSavingSession.topAnchor).isActive = true
        lblSavingSession.bottomAnchor.constraint(equalTo: swtSavingSession.bottomAnchor).isActive = true
        lblSavingSession.rightAnchor.constraint(equalTo: txtPassword.rightAnchor).isActive = true
    }

    private func activateBtnLoginConstraints() {
        btnLoginTopAnchor.isActive = true
        btnLogin.rightAnchor.constraint(equalTo: txtPassword.rightAnchor).isActive = true
        btnLogin.leftAnchor.constraint(equalTo: txtPassword.leftAnchor).isActive = true
        btnLoginHeightAnchor.isActive = true
    }

    private func setKeyboardDistanceFromTxtPassword() {
        txtPassword.keyboardDistanceFromTextField = txtPasswordHeightAnchor.constant
                                                    + btnLoginTopAnchor.constant
                                                    + btnLoginHeightAnchor.constant + 16
                                                    + swtSavingSessionTopAnchor.constant
                                                    + swtSavingSession.bounds.height
    }

    private func setupView() {
        backgroundColor = ColorName.blackPearl
        addSubviews()
        activateImgLogoConstraints()
        activateTxtUsernameConstraints()
        activateTxtPasswordConstraints()
        activateSwitchSavingSessionConstraints()
        activateLblSavingSessionConstraints()
        activateBtnLoginConstraints()
        setKeyboardDistanceFromTxtPassword()
    }

}
