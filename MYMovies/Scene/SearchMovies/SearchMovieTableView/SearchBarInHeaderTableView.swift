//
//  SearchBarHeaderTableView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 27.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchBarInHeaderTableView: UITableView {
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = true
        //searchController.definesPresentationContext = false
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
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        translatesAutoresizingMaskIntoConstraints = false
        rowHeight = 80
        
        addSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setSearchCTableViewProvider(_ provider: SearchTableViewProvider) {
        searchController.searchBar.delegate = provider
        searchController.searchResultsUpdater = provider
    }
    
    //MARK: - Private metods
    private func addSearchBar() {
        tableHeaderView = searchController.searchBar
    }

}
