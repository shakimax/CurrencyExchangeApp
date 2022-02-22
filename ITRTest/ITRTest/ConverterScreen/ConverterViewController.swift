//
//  ConverterViewController.swift
//  ITRTest
//
//  Created by Максим on 8.02.22.
//

import UIKit

class ConverterViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let currencyConverterView = ConverterView()
    
    private var result: ConvertedCurrecy?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = currencyConverterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupView()
        setupCurrencyButtons()
        startEnteringValue()
    }
    
    // MARK: - Private Methods
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Currency Converter"
    }
    
    private func setupView() {
        currencyConverterView.setDelegate(delegate: self)
    }
    
    private func setupCurrencyButtons() {
        currencyConverterView.changeFirstCurrencyButton.tag = 1
        currencyConverterView.changeSecondCurrencyButton.tag = 2
        currencyConverterView.changeFirstCurrencyButton.addTarget(self, action: #selector(didTapChooseCurrencyButton), for: .touchUpInside)
        currencyConverterView.changeSecondCurrencyButton.addTarget(self, action: #selector(didTapChooseCurrencyButton), for: .touchUpInside)
    }
    
    private func currencySelected(tag: Int, currency: Currency) {
        let title = currency.code
        let image = UIImage(named: currency.code)
        
        if tag == 1 {
            currencyConverterView.firstCurrencyLabel.text = title
            currencyConverterView.firstCurrencyFlag.image = image
        }
        if tag == 2 {
            currencyConverterView.secondCurrencyLabel.text = title
            currencyConverterView.secondCurrencyFlag.image = image
        }
    }
    
    private func startEnteringValue() {
        currencyConverterView.firstCurrencyTextField.addTarget(self, action: #selector(convertForward), for: .editingChanged)
        currencyConverterView.secondCurrencyTextField.addTarget(self, action: #selector(convertBack), for: .editingChanged)
    }
    
    @objc private func didTapChooseCurrencyButton(_ sender: UIButton) {
        let currencyChoiceVC = CurrencyListViewController()
        currencyChoiceVC.currencySelected = { [weak self] currency in
            self?.currencySelected(tag: sender.tag, currency: currency)
        }
        self.navigationController?.pushViewController(currencyChoiceVC, animated: true)
        currencyConverterView.firstCurrencyTextField.text = ""
        currencyConverterView.secondCurrencyTextField.text = ""
    }
    @objc private func convertForward() {
        guard let firstValue = currencyConverterView.firstCurrencyTextField.text?.toDouble() else { return }
        guard let firstCode = currencyConverterView.firstCurrencyLabel.text else { return }
        guard let secondCode = currencyConverterView.secondCurrencyLabel.text else { return }

        NetworkService.convert(baseCurrency: firstCode, targetCurrency: secondCode, amountToConvert: firstValue) { [weak self] amount, error in
            if let amount = amount {
                DispatchQueue.main.async { [weak self] in
                    self?.result = amount
                    guard let convertedAmount = self?.result?.conversionResult else { return }
                    self?.currencyConverterView.secondCurrencyTextField.text = String(format: "%.2f", convertedAmount)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    @objc private func convertBack() {
        guard let secondValue = currencyConverterView.secondCurrencyTextField.text?.toDouble() else { return }
        guard let firstCode = currencyConverterView.firstCurrencyLabel.text else { return }
        guard let secondCode = currencyConverterView.secondCurrencyLabel.text else { return }
        
        NetworkService.convert(baseCurrency: secondCode, targetCurrency: firstCode, amountToConvert: secondValue) { [weak self] amount, error in
            if let amount = amount {
                DispatchQueue.main.async { [weak self] in
                    self?.result = amount
                    guard let convertedAmount = self?.result?.conversionResult else { return }
                    self?.currencyConverterView.firstCurrencyTextField.text = String(format: "%.2f", convertedAmount)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}

// MARK: - UITextFieldDelegate

extension ConverterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        if currencyConverterView.firstCurrencyTextField.text?.count == 1 {
            currencyConverterView.secondCurrencyTextField.text = ""
        } else if currencyConverterView.secondCurrencyTextField.text?.count == 1 {
            currencyConverterView.firstCurrencyTextField.text = ""
        }
        
        if string == "" {
            return true
        }
        if (text.contains(".")) && string == "." {
            return false
        }
        if (text.contains(".")) {
            let limitDecimalPlace = 2
            guard let decimalPlace = text.components(separatedBy: ".").last else { return false }
            if (decimalPlace.count) < limitDecimalPlace {
                return true
            }
            else {
                return false
            }
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}
