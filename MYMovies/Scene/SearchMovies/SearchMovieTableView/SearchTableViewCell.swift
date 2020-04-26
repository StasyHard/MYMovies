//
//  SearchTableViewCell.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell, ReusableView {
//    
//    //MARK: - Private properties
//    private let searchController: UISearchController = {
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.definesPresentationContext = true
//        searchController.searchBar.placeholder = "Найти фильм или сериал"
//        searchController.searchBar.searchBarStyle = .minimal
//        searchController.searchBar.setValue("Отменить", forKey: "cancelButtonText")
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.searchBar.sizeToFit()
//        searchController.searchBar.backgroundColor = UIColor.AppColors.backgroundColor
//        //searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false
//        return searchController
//    }()
//    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        addSearchBar()
//        searchController.searchBar.delegate = self
//        searchController.searchResultsUpdater = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    //MARK: - Open metods
//
//    
//    //MARK: - Private metods
//    private func addSearchBar() {
//        addSubview(searchController.searchBar)
//        
//        NSLayoutConstraint.activate([
//            searchController.searchBar.topAnchor.constraint(equalTo: self.topAnchor),
//            searchController.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            searchController.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            searchController.searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//        
//    }
//    
//}
//
//extension SearchTableViewCell: UISearchResultsUpdating, UISearchBarDelegate {
//    func updateSearchResults(for searchController: UISearchController) {
//        print("Введен текст")
//    }
}
