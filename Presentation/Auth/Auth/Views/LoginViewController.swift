//
//  LoginViewController.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Common
import SwiftMessages

public class LoginViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var loginView = LoginView()
    private let presenter: LoginViewPresenting

    // MARK: Init
    public init(presenter: LoginViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = loginView
        loginView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: UI
extension LoginViewController {

    private func setupUI() {
        loginView.btnLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
}

// MARK: Actions
extension LoginViewController {

    @objc private func login() {
        view.endEditing(true)
        presenter.authenticate(user: loginView.txtUsername.text ?? "",
                               password: loginView.txtPassword.text ?? "",
                               savingSession: loginView.swtSavingSession.isOn)
    }
}

// MARK: LoginViewDelegate
extension LoginViewController: LoginViewDelegate {

}

// MARK: LoginViewable
extension LoginViewController: LoginViewable {

    public func showGeneral(error: String) {
        SwiftMessages.show(error: error)
    }

    public func showUser(error: String) {
        loginView.txtUsername.set(error: error)
    }

    public func showPassword(error: String) {
        loginView.txtPassword.set(error: error)
    }

    public func showRequestToken(url: URL) {

    }
}
