//
//  Untitled.swift
//  PayUp
//
//  Created by Diogo on 04/08/2025.
//

import Foundation
import UIKit

final class SplashViewController: UIViewController {
    
    private let contentView = SplashView()
    private let viewModel = SplashViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.view = contentView
        startAnimation()
        setupConstraints()
    }
    
    func setupConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func startAnimation() {
        contentView.triangleImageView.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        viewModel.performInitialAnimation { [weak self] in
            guard let self = self else {
                return
            }
            
            UIView.animate(withDuration: 0.8, animations: {
                self.contentView.triangleImageView.alpha = 1
                self.contentView.triangleImageView.transform = CGAffineTransform.identity
            }, completion: { _ in
                UIView.animate(withDuration: 0.5,delay: 0.3, options: .curveEaseInOut) {
                    self.contentView.logoImageView.alpha = 1
                } completion: { _ in
                    self.viewModel.onAnimationComplete?()
                }
            })
        }
    }
        
    
}

