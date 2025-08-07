import Foundation
import UIKit

final class SplashView: UIView {
    
    let triangleImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "backgroundImage")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(named: "logo")
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        return imageView
    }()
    
    private let authentication  = AuthenticationCard()
    
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
        addSubview(authentication)
        addSubview(logoImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            triangleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            triangleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            triangleImageView.topAnchor.constraint(equalTo: topAnchor),
            triangleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            authentication.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            authentication.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            authentication.centerYAnchor.constraint(equalTo: centerYAnchor),
            authentication.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
        
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}
