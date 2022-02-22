//
//  CurrencyListViewController.swift
//  ITRTest
//
//  Created by Максим on 8.02.22.
//

import Foundation
import UIKit

class CurrencyListViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let currenciesListView = CurrencyListView()
    
    private var allCurrencies: [Currency] = []
    
    private var filteredCurrencies: [Currency] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.currenciesListView.reloadTableView()
            }
        }
    }
        
    // MARK: - Internal properties
    
    var currencySelected: ((Currency) -> ())?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = currenciesListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationController()
        setupSearchController()
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        currenciesListView.setDelegate(delegate: self)
        currenciesListView.setDataSource(dataSource: self)
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "Currencies"
        navigationController?.navigationBar.backgroundColor = .tertiarySystemBackground
    }
    
    private func setupSearchController() {
        currenciesListView.searchController.searchBar.delegate = self
        navigationItem.searchController = currenciesListView.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func loadData() {
        allCurrencies = codes
        filteredCurrencies = allCurrencies
    }
    
    private func filterCurrencies(text: String) {
        guard !text.isEmpty else {
            filteredCurrencies = allCurrencies
            return
        }
        
        filteredCurrencies = allCurrencies.filter {
            $0.code.lowercased().contains(text.lowercased())
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyListTableViewCell.reuseId, for: indexPath) as? CurrencyListTableViewCell else { return UITableViewCell() }
        cell.setup(with: filteredCurrencies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCurrency = filteredCurrencies[indexPath.row]
        currencySelected?(selectedCurrency)
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UISearchBarDelegate, UISearchResultsUpdating

extension CurrencyListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredCurrencies = allCurrencies
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterCurrencies(text: searchText)
    }
}
