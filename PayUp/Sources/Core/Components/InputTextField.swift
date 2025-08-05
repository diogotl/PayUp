//
//  InputTextField.swift
//  PayUp
//
//  Created by Diogo on 04/08/2025.
//

import Foundation
import UIKit

enum InputTextFieldType {
    case normal
    case cellphone
    case cnpj
}

final class InputTextField: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.textColor = .black
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        textField.leftViewMode = .always
        return textField
    }()
    
    private let type: InputTextFieldType
    
    init(
        title: String,
        placeholder: String,
        type: InputTextFieldType = .normal
    ) {
        self.type = type
        super.init(frame: .zero)
        setupView(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(placeholder: String) {
        addSubview(titleLabel)
        addSubview(textField)
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.heightAnchor.constraint(equalToConstant: 44),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTextFieldPlaceholder(placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
        
        textField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc
    private func textDidChange() {
        switch type {
        case .normal:
            break
        case .cellphone:
            formatPhoneNumber()
        case .cnpj:
            formatCNPJ()
        }
    }
    
    private func formatPhoneNumber() {
        guard let text = textField.text else { return }
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "(##) #####-####"
        textField.text = applyMask(mask: mask, to: cleanPhoneNumber)
    }
    
    private func formatCNPJ() {
        guard let text = textField.text else { return }
        let cleanCNPJ = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "##.###.###/####-##"
        textField.text = applyMask(mask: mask, to: cleanCNPJ)
    }
    
    private func applyMask(mask: String, to value: String) -> String {
        var result = ""
        var index = value.startIndex
        for ch in mask where index < value.endIndex {
            if ch == "#" {
                result.append(value[index])
                index = value.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
}
