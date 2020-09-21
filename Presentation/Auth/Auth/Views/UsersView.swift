//
//  UsersView.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit

protocol UsersViewDelegate: AnyObject {

}

public class UsersView: UIView {

    weak var delegate: UsersViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func setupView() {
        backgroundColor = .red
    }
}
