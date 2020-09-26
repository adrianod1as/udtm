//
//  HomeViewController.swift
//  Home
//
//  Created by Adriano Dias on 24/09/20.
//

import UIKit
import Common

public class HomeViewController: UIViewController, UDTAnimatorViewable {

    // MARK: Properties
    private lazy var homeView = HomeView()
    private lazy var titleView: HomeTitleView = {
        let view = HomeTitleView()
        if let bounds = navigationController?.navigationBar.bounds {
            view.frame = bounds
        }
        return view
    }()
    private let presenter: HomeViewPresenting

    // MARK: Init
    public init(presenter: HomeViewPresenting) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Life cycle
    public override func loadView() {
        view = homeView
        homeView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension HomeViewController {

    func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }
}

// MARK: HomeViewDelegate
extension HomeViewController: HomeViewDelegate {

}

// MARK: HomeViewable
extension HomeViewController: HomeViewable {

}
