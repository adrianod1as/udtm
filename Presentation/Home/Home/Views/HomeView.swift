//
//  HomeView.swift
//  Home
//
//  Created by Adriano Dias on 24/09/20.
//

import UIKit
import Common

protocol HomeViewDelegate: AnyObject {

}

public class HomeView: UIView {

    weak var delegate: HomeViewDelegate? {
        didSet {
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

    private func setupView() {
        backgroundColor = ColorName.blackPearl
    }
}
