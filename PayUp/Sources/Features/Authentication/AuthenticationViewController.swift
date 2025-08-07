//
//  AuthenticationViewController.swift
//  PayUp
//
//  Created by Diogo on 06/08/2025.
//

import Foundation
import UIKit

final class AuthenticationViewController: UIViewController {
    
    let contentView: AuthenticationView
    
    init(
        contentView: AuthenticationView
    ){
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    private func setup() {
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

