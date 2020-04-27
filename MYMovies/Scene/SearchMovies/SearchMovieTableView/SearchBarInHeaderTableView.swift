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
        let сontroller = UISearchController(searchResultsController: nil)
        сontroller.obscuresBackgroundDuringPresentation = true
        //searchController.definesPresentationContext = false
        сontroller.searchBar.placeholder = "Найти фильм или сериал"
        сontroller.searchBar.searchBarStyle = .minimal
        сontroller.searchBar.setValue("Отменить", forKey: "cancelButtonText")
        //searchController.searchBar.scopeButtonTitles = ["Все результаты", "Фильмы", "Сериалы"]
        сontroller.hidesNavigationBarDuringPresentation = false
        сontroller.searchBar.sizeToFit()
        сontroller.searchBar.backgroundColor = UIColor.AppColors.backgroundColor
        return сontroller
    }()
    
    //MARK: - Init
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        translatesAutoresizingMaskIntoConstraints = false
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
