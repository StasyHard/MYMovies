//
//  SearchMovieView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SearchMovieViewsActions: class {
    
}

class SearchMovieView: UIView {
    
    //MARK: - Private properties
    private weak var container: SearchMovieViewsActions?
    
    private let searchMovietableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.tableHeaderView?.backgroundColor = UIColor.AppColors.backgroundColor
        tableView.rowHeight = 80
        return tableView
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти фильм или сериал"
        //searchController.searchBar.showsCancelButton = true
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.setValue("Отменить", forKey: "cancelButtonText")
        //searchController.searchBar.scopeButtonTitles = ["Все результаты", "Фильмы", "Сериалы"]
        searchController.searchBar.sizeToFit()
        searchController.searchBar.backgroundColor = UIColor.AppColors.backgroundColor
        return searchController
    }()
    
    //MARK: - Init
    init(frame: CGRect, container: SearchMovieViewsActions) {
        super.init(frame: frame)
        self.container = container
        self.backgroundColor = UIColor.AppColors.backgroundColor
        
        addSearchMovietableView()
        addSearchBar() 
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Select init with container")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        //MARK: - Private metods
    private func addSearchMovietableView() {
        addSubview(searchMovietableView)
        NSLayoutConstraint.activate([
            searchMovietableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchMovietableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            searchMovietableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchMovietableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func addSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchMovietableView.tableHeaderView = searchController.searchBar
    }
    
}

extension SearchMovieView: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
