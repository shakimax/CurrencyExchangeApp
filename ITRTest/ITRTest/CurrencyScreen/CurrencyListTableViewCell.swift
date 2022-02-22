//
//  CurrencyListTableViewCell.swift
//  ITRTest
//
//  Created by Максим on 8.02.22.
//

import Foundation

import UIKit

class CurrencyListTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let flagImageView: UIImageView = {
        let flagImageView = UIImageView()
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleToFill
        flagImageView.clipsToBounds = true
        flagImageView.layer.borderWidth = 0.3
        flagImageView.layer.borderColor = UIColor.systemGray.cgColor
        return flagImageView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubviews()
        backgroundColor = .tertiarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal methods
    
    func setup(with currency: Currency) {
        nameLabel.text = "\(currency.code)"
        flagImageView.image = UIImage(named: "\(currency.code)")
    }
    
    // MARK: - Private methods
    
    private func createSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(flagImageView)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            flagImageView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            flagImageView.widthAnchor.constraint(equalToConstant: 40),
            flagImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
