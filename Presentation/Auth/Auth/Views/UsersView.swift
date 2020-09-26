//
//  UsersView.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import Common

protocol UsersViewDelegate: AnyObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

}

public class UsersView: UIView {

    private lazy var collectionLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = ColorName.blackPearl
        collectionView.register(UsersCell.self, forCellWithReuseIdentifier: UsersCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return collectionView
    }()

    weak var delegate: UsersViewDelegate? {
        didSet {
            collectionView.delegate = delegate
            collectionView.dataSource = delegate
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

    private func activateCollectionViewConstraints() {
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func setupView() {
        addSubview(collectionView)
        activateCollectionViewConstraints()
    }
}
