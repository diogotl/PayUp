//
//  AuthenticationCard.swift
//  PayUp
//
//  Created by Diogo on 06/08/2025.
//

import UIKit

final class AuthenticationCard: UIView {
    
    private let blurView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .systemChromeMaterialDark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "logo")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 1
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá Diogo,"
        label.textColor = Colors.textHeading
        label.font = Typography.titleLarge()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Desbloqueia com segurança com o Face ID."
        label.textColor = Colors.textParagraph
        label.font = Typography.labelMedium()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let faceIdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "faceid"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let helpContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let helpIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "questionmark.circle.fill"))
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let helpLabel: UILabel = {
        let label = UILabel()
        label.text = "Ainda não tem uma conta?"
        label.textColor = .white
        label.font = Typography.labelMedium()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let helpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Precisa de ajuda?", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = Typography.labelMedium()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(blurView)
        blurView.contentView.addSubview(logoImageView)
        blurView.contentView.addSubview(welcomeLabel)
        blurView.contentView.addSubview(subtitleLabel)
        blurView.contentView.addSubview(faceIdButton)
        blurView.contentView.addSubview(helpContainer)
        helpContainer.addSubview(helpIcon)
        helpContainer.addSubview(helpLabel)
        helpContainer.addSubview(helpButton)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 120),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 24),
            
            subtitleLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 24),
            
            faceIdButton.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            faceIdButton.centerXAnchor.constraint(equalTo: blurView.centerXAnchor),
            
            helpContainer.bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: -16),
            helpContainer.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 16),
            helpContainer.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -16),
            helpContainer.heightAnchor.constraint(equalToConstant: 80),
            
            helpIcon.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpIcon.leadingAnchor.constraint(equalTo: helpContainer.leadingAnchor),
            helpIcon.widthAnchor.constraint(equalToConstant: 24),
            helpIcon.heightAnchor.constraint(equalToConstant: 24),
            helpLabel.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpLabel.leadingAnchor.constraint(equalTo: helpIcon.trailingAnchor, constant: 8),
            helpLabel.trailingAnchor.constraint(equalTo: helpButton.leadingAnchor, constant: -8),
            helpButton.centerYAnchor.constraint(equalTo: helpContainer.centerYAnchor),
            helpButton.trailingAnchor.constraint(equalTo: helpContainer.trailingAnchor),
            helpButton.widthAnchor.constraint(equalToConstant: 120)
            
        ])
    }
}
