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
    private weak var container: (SearchMovieViewsActions & SearchTableViewProvider)?
    
    private let searchMovietableView: SearchBarInHeaderTableView = {
        let tableView = SearchBarInHeaderTableView(frame: .zero, style: .plain)
        return tableView
    }()
    
    //MARK: - Init
    init(frame: CGRect, container: SearchMovieViewsActions & SearchTableViewProvider) {
        super.init(frame: frame)
        self.container = container
        self.backgroundColor = UIColor.AppColors.backgroundColor
        
        addSearchMovietableView()
        registerSearchMovietableViewCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Select init with container")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setSearchMovietableViewProvider(_ provider: TableViewProvider) {
        searchMovietableView.delegate = provider
        searchMovietableView.dataSource = provider
    }
    
    func reloadDataSearchMovietableView() {
        searchMovietableView.reloadData()
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
    

}


