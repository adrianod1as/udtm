//
//  UsersViewController.swift
//  Auth
//
//  Created by Adriano Dias on 20/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import UIKit
import SwiftMessages
import Common

public class UsersViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var usersView = UsersView()
    private let presenter: UsersViewPresenting
    private var users = [LogableUser]()

    // MARK: Init
    public init(presenter: UsersViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = usersView
        usersView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        presenter.getUsers()
        setupUI()
    }
}

extension UsersViewController {

    func setupUI() {
        title = "Who's searching?"
        navigationController?.asTranslucentWithImageNavigationController()
    }
}

// MARK: UsersViewDelegate
extension UsersViewController: UsersViewDelegate {

    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: UsersCell.identifier, for: indexPath) as? UsersCell else {
            return UICollectionViewCell()
        }
        cell.bind(user: users[indexPath.row])
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 58) / 2
        let height = width + 24
        return CGSize(width: width, height: height)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter.select(user: users[indexPath.row])
    }
}

// MARK: UsersViewable
extension UsersViewController: UsersViewable {

    public func show(users: [LogableUser]) {
        self.users = users
        usersView.collectionView.reloadData()
    }

    public func show(error: String) {
        SwiftMessages.show(error: error)
    }

}
