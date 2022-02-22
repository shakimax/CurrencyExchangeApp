//
//  ConverterView.swift
//  ITRTest
//
//  Created by Максим on 8.02.22.
//

import Foundation
import UIKit

class ConverterView: UIView {
    
    // MARK: - Internal Properties
    
    let firstCurrencyTextField: TextFieldPadding = {
        let firstCurrencyTextField = TextFieldPadding()
        firstCurrencyTextField.setupTextfield()
        return firstCurrencyTextField
    }()
    
    let secondCurrencyTextField: TextFieldPadding = {
        let secondCurrencyTextField = TextFieldPadding()
        secondCurrencyTextField.setupTextfield()
        return secondCurrencyTextField
    }()
    
    let firstCurrencyLabel: UILabel = {
        let firstCurrencyLabel = UILabel()
        firstCurrencyLabel.text = "BYN"
        firstCurrencyLabel.setupCurrencyLabel()
        return firstCurrencyLabel
    }()
    
    let secondCurrencyLabel: UILabel = {
        let secondCurrencyLabel = UILabel()
        secondCurrencyLabel.text = "USD"
        secondCurrencyLabel.setupCurrencyLabel()
        return secondCurrencyLabel
    }()
    
    let firstCurrencyFlag: UIImageView = {
        let firstCurrencyFlag = UIImageView()
        firstCurrencyFlag.image = UIImage(named: "BYN")
        firstCurrencyFlag.setupFlagImageView()
        return firstCurrencyFlag
    }()
    
    let secondCurrencyFlag: UIImageView = {
        let secondCurrencyFlag = UIImageView()
        secondCurrencyFlag.image = UIImage(named: "USD")
        secondCurrencyFlag.setupFlagImageView()
        return secondCurrencyFlag
    }()
    
    let changeFirstCurrencyButton: UIButton = {
        let changeFirstCurrencyButton = UIButton()
        changeFirstCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        changeFirstCurrencyButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        changeFirstCurrencyButton.clipsToBounds = true
        return changeFirstCurrencyButton
    }()
    
    let changeSecondCurrencyButton: UIButton = {
        let changeSecondCurrencyButton = UIButton()
        changeSecondCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        changeSecondCurrencyButton.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        changeSecondCurrencyButton.clipsToBounds = true
        return changeSecondCurrencyButton
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods

    func setDelegate(delegate: UITextFieldDelegate) {
        firstCurrencyTextField.delegate = delegate
        secondCurrencyTextField.delegate = delegate
    }
    
    // MARK: - Private Methods
    
    private func createSubviews() {
        addSubview(firstCurrencyTextField)
        addSubview(secondCurrencyTextField)
        addSubview(changeFirstCurrencyButton)
        addSubview(changeSecondCurrencyButton)
        addSubview(firstCurrencyFlag)
        addSubview(secondCurrencyFlag)
        addSubview(firstCurrencyLabel)
        addSubview(secondCurrencyLabel)
    
        NSLayoutConstraint.activate([
            firstCurrencyTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstCurrencyTextField.centerYAnchor.constraint(equalTo: secondCurrencyTextField.centerYAnchor, constant: -100),
            firstCurrencyTextField.heightAnchor.constraint(equalToConstant: 50),
            firstCurrencyTextField.widthAnchor.constraint(equalToConstant: 300),
            
            secondCurrencyTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondCurrencyTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            secondCurrencyTextField.heightAnchor.constraint(equalToConstant: 50),
            secondCurrencyTextField.widthAnchor.constraint(equalToConstant: 300),
            
            firstCurrencyLabel.topAnchor.constraint(equalTo: firstCurrencyTextField.topAnchor, constant: 8),
            firstCurrencyLabel.trailingAnchor.constraint(equalTo: firstCurrencyFlag.leadingAnchor, constant: -8),
            firstCurrencyLabel.widthAnchor.constraint(equalToConstant: 50),
            firstCurrencyLabel.bottomAnchor.constraint(equalTo: firstCurrencyTextField.bottomAnchor, constant: -8),

            secondCurrencyLabel.topAnchor.constraint(equalTo: secondCurrencyTextField.topAnchor, constant: 8),
            secondCurrencyLabel.trailingAnchor.constraint(equalTo: secondCurrencyFlag.leadingAnchor, constant: -8),
            secondCurrencyLabel.widthAnchor.constraint(equalToConstant: 50),
            secondCurrencyLabel.bottomAnchor.constraint(equalTo: secondCurrencyTextField.bottomAnchor, constant: -8),

            firstCurrencyFlag.centerYAnchor.constraint(equalTo: firstCurrencyTextField.centerYAnchor),
            firstCurrencyFlag.trailingAnchor.constraint(equalTo: changeFirstCurrencyButton.leadingAnchor, constant: -8),
            firstCurrencyFlag.widthAnchor.constraint(equalToConstant: 30),
            firstCurrencyFlag.heightAnchor.constraint(equalToConstant: 30),

            secondCurrencyFlag.centerYAnchor.constraint(equalTo: secondCurrencyTextField.centerYAnchor),
            secondCurrencyFlag.trailingAnchor.constraint(equalTo: changeSecondCurrencyButton.leadingAnchor, constant: -8),
            secondCurrencyFlag.widthAnchor.constraint(equalToConstant: 30),
            secondCurrencyFlag.heightAnchor.constraint(equalToConstant: 30),

            changeFirstCurrencyButton.centerYAnchor.constraint(equalTo: firstCurrencyTextField.centerYAnchor),
            changeFirstCurrencyButton.trailingAnchor.constraint(equalTo: firstCurrencyTextField.trailingAnchor, constant: -8),
            changeFirstCurrencyButton.widthAnchor.constraint(equalToConstant: 30),
            changeFirstCurrencyButton.heightAnchor.constraint(equalToConstant: 30),

            changeSecondCurrencyButton.centerYAnchor.constraint(equalTo: secondCurrencyTextField.centerYAnchor),
            changeSecondCurrencyButton.trailingAnchor.constraint(equalTo: secondCurrencyTextField.trailingAnchor, constant: -8),
            changeSecondCurrencyButton.widthAnchor.constraint(equalToConstant: 30),
            changeSecondCurrencyButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
