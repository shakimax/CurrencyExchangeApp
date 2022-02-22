//
//  CurrencyListView.swift
//  ITRTest
//
//  Created by Максим on 8.02.22.
//

import Foundation

import UIKit

class CurrencyListView: UIView {
    
    // MARK: - Internal Properties
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CurrencyListTableViewCell.self, forCellReuseIdentifier: CurrencyListTableViewCell.reuseId)
        tableView.backgroundColor = .tertiarySystemBackground
        return tableView
    }()
    
    var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Currencies"
        return searchController
    }()
    
    // MARK: - Internal methods
    
    func setDelegate(delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }
    
    func setDataSource(dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .tertiarySystemBackground
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func createSubviews() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
