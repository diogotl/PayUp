//
//  SplashView.swift
//  PayUp
//
//  Created by Diogo on 04/08/2025.
//

import Foundation
import UIKit

final class SplashView: UIView{
    
    let triangleImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "backgroundImage") ?? UIImage(systemName: "triangle.fill")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "logo") ?? UIImage(systemName: "logo.fill")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .black
        addSubview(triangleImageView)
        addSubview(logoImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            triangleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            triangleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            triangleImageView.topAnchor.constraint(equalTo: topAnchor),
            triangleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
