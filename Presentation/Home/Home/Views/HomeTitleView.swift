//
//  HomeTitleView.swift
//  Home
//
//  Created by Adriano Dias on 25/09/20.
//

import UIKit
import Common

public class HomeTitleView: UIView {

    lazy var imgLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = Asset.movie.image
        return imgView
    }()

    lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.font = FontFamily.RubikMedium.regular.font(size: UIScreen.isLarge ? 20 : 16)
        label.text = L10n.HomeTitleView.title
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = ColorName.amethyst
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
    }

    private func setupView() {
        addSubviews()
        activateImgLogoConstraints()
        activateLblTitleConstraints()
    }

    private func addSubviews() {
        addSubview(imgLogo)
        addSubview(lblTitle)
    }

    private func activateImgLogoConstraints() {
        imgLogo.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgLogo.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imgLogo.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imgLogo.widthAnchor.constraint(equalTo: imgLogo.heightAnchor).isActive = true
    }

    private func activateLblTitleConstraints() {
        lblTitle.leftAnchor.constraint(equalTo: imgLogo.rightAnchor, constant: 8).isActive = true
        lblTitle.topAnchor.constraint(equalTo: imgLogo.topAnchor).isActive = true
        lblTitle.bottomAnchor.constraint(equalTo: imgLogo.bottomAnchor).isActive = true
        lblTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
