//
//  Untitled.swift
//  PayUp
//
//  Created by Diogo on 07/08/2025.
//

import UIKit
import Foundation

final class HomeView: UIView {
    
    private let header: UIView = {
        let header = UIView()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.backgroundColor = Colors.backgroundPrimary
        return header
    }()
    
    private let bellButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.tintColor = Colors.textSpan
        button.addTarget(self, action: #selector(bellButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func bellButtonTapped(){
        // Handle bell button tap
        print("Bell button tapped")
    }
    
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    private let avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.contentMode = .scaleAspectFill
        avatar.layer.cornerRadius = 20
        avatar.layer.masksToBounds = true
        avatar.image = UIImage(named: "avatar")
        return avatar
    }()
    
    let daySelectorView: DaySelectorView = {
        let view = DaySelectorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        self.addSubview(header)
        header.addSubview(logo)
        header.addSubview(bellButton)
        header.addSubview(avatar)
        self.addSubview(daySelectorView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            header.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 100),
            
            logo.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            logo.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 80),
            logo.heightAnchor.constraint(equalToConstant: 40),
            
            bellButton.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            bellButton.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            bellButton.widthAnchor.constraint(equalToConstant: 24),
            bellButton.heightAnchor.constraint(equalToConstant: 24),
            
            avatar.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
            avatar.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 40),
            avatar.heightAnchor.constraint(equalToConstant: 40),
            
            daySelectorView.topAnchor.constraint(equalTo: header.bottomAnchor),
            daySelectorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            daySelectorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            daySelectorView.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
}

