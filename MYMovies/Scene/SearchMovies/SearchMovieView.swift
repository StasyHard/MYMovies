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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //tableView.backgroundColor = UIColor.AppColors.backgroundColor
        tableView.rowHeight = 80
        return tableView
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Найти фильм или сериал"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.setValue("Отменить", forKey: "cancelButtonText")
        //searchController.searchBar.scopeButtonTitles = ["Все результаты", "Фильмы", "Сериалы"]
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.backgroundColor = UIColor.AppColors.backgroundColor
        //searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchController
    }()
    
    //MARK: - Init
    init(frame: CGRect, container: SearchMovieViewsActions) {
        super.init(frame: frame)
        self.container = container
        self.backgroundColor = UIColor.AppColors.backgroundColor
        
        addSearchMovietableView()
        registerSearchMovietableViewCell()
        addSearchBar()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Select init with container")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setSearchControllerProvider(_ provider: SearchMovieViewController) {
        searchController.searchBar.delegate = provider
        searchController.searchResultsUpdater = provider
    }
    
    func setSearchMovietableViewProvider(_ provider: TableViewProvider) {
        searchMovietableView.delegate = provider
        searchMovietableView.dataSource = provider
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
    
    private func registerSearchMovietableViewCell() {
        searchMovietableView.register(
            SearchTableViewCell.self,
            forCellReuseIdentifier: SearchTableViewCell.reuseIdD)
    }
    
    private func addSearchBar() {
        searchMovietableView.tableHeaderView = searchController.searchBar
        //searchMovietableView.tableHeaderView?.addSubview(searchController.searchBar)
 //       NSLayoutConstraint.activate([
//            searchController.searchBar.topAnchor.constraint(equalTo: searchMovietableView.topAnchor),
//            searchController.searchBar.leadingAnchor.constraint(equalTo: searchMovietableView.leadingAnchor),
//            searchController.searchBar.trailingAnchor.constraint(equalTo: searchMovietableView.trailingAnchor),
//            //searchController.searchBar.heightAnchor.constraint(equalToConstant: 40.0),
//            searchController.searchBar.bottomAnchor.constraint(equalTo: searchMovietableView.bottomAnchor)
//        ])
    }
}


