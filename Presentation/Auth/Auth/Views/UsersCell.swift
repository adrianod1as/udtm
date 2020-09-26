//
//  UsersCell.swift
//  Auth
//
//  Created by Adriano Dias on 22/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Common

class UsersCell: UICollectionViewCell {

    internal lazy var imgAvatar: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.layer.borderWidth = 2
        imgView.layer.borderColor = ColorName.white.cgColor
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 4
        return imgView
    }()

    internal lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = ColorName.white
        label.font = FontFamily.Rubik.regular.font(size: 18)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    private func addSubviews() {
        addSubview(imgAvatar)
        addSubview(lblTitle)
    }

    private func activateImgAvatarConstraints() {
        imgAvatar.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgAvatar.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imgAvatar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgAvatar.bottomAnchor.constraint(equalTo: lblTitle.topAnchor, constant: -4).isActive = true
    }

    private func activateLblTitleConstraints() {
        lblTitle.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lblTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setup() {
        addSubviews()
        activateImgAvatarConstraints()
        activateLblTitleConstraints()
    }

    func bind(user: LogableUser) {
        if let image = user.avatarIcon {
            imgAvatar.image = image
        } else if let url = user.avatarURL {
            imgAvatar.set(concontentsOf: url, completion: nil)
        }
        lblTitle.text = user.title
        imgAvatar.backgroundColor = user.backgroundColor
    }
}
