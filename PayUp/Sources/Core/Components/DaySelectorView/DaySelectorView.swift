//
//  DaySelectorView.swift
//  PayUp
//
//  Created by Diogo on 05/10/2025.
//

import Foundation
import UIKit

final class DaySelectorView:UIView {
    private let viewModel = DaySelectorViewModel()
    private var buttons: [UIButton] = []
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupButtons()
        updateButtonSelection(index: viewModel.selectedIndex)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            // Pin the stack view to the scroll view's content layout guide
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            // Match the stack view height to the scroll view frame so it scrolls horizontally
            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
        ])
    }
    
    private func setupButtons() {
        for (index, day) in viewModel.days.enumerated() {
            var configuration = UIButton.Configuration.filled()
            configuration.title = day
            configuration.baseBackgroundColor = .systemGray5
            configuration.baseForegroundColor = .black
            configuration.cornerStyle = .capsule
            configuration.buttonSize = .small
            
            let button = UIButton(configuration: configuration, primaryAction: nil)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.titleLabel?.textColor = .white
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            button.heightAnchor.constraint(equalToConstant: 32).isActive = true
            button.widthAnchor.constraint(equalToConstant: 48).isActive = true
            button.tag = index
            button.addTarget(self, action: #selector(dayButtonTapped(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }
    }
    
    @objc
    private func dayButtonTapped (_ sender: UIButton) {
        updateButtonSelection(index: sender.tag)
        viewModel.selectDay(at: sender.tag)
    }
    
    private func updateButtonSelection(index: Int) {
        
        for (i, button) in buttons.enumerated() {
            let isSelected = (i == index)
            
            button.configuration?.baseBackgroundColor = isSelected ? Colors.accentBrand : Colors.textHeading
            button.layer.borderColor = isSelected ? Colors.accentBrand.cgColor : UIColor.systemGray4.cgColor
            
        }
            
    }
}
