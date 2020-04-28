//
//  MyMoviesView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 24.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol MyMoviesViewsActions: class {
    
}

class MyMoviesView: UIView {
    
    //MARK: - Private properties
    private weak var container: MyMoviesViewsActions?
    
    //MARK: - Private properties
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        return tableView
    }()
    
    init(frame: CGRect, container: MyMoviesViewsActions) {
        super.init(frame: frame)
        self.container = container
        self.backgroundColor = UIColor.AppColors.backgroundColor
        
        addMyMoviesTableView()
        registerAddMyMoviesTableViewCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Error: - Select init with container")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setMyMoviesTableViewProvider(_ provider: TableViewProvider) {
        tableView.delegate = provider
        tableView.dataSource = provider
    }
    func reloadDataMoviesInViewingTableView() {
        tableView.reloadData()
    }
    
    //MARK: - Private metods
    private func addMyMoviesTableView() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func registerAddMyMoviesTableViewCell() {
        tableView.register(MyMoviesTableViewCell.self, forCellReuseIdentifier: MyMoviesTableViewCell.reuseIdD)
        
    }
    
    
}
