//
//  ProfileView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 20.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileViewsActions: class {
    func didPressedSearchMovieButton()
    func didPressedMyMoviesButton()
}

class ProfileView: UIView {
    
    //MARK: - Private properties
    private weak var container: ProfileViewsActions?
    
    private let searchMoviesButton: BlueWithShadowButton = {
        let button = BlueWithShadowButton(type: .roundedRect)
        button.setTitleAndFont(title: "Найти фильм или сериал", font: .boldSystemFont(ofSize: 17))
        button.addTarget(self, action: #selector(searchMoviesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let myMoviesButton: BlueWithShadowButton = {
        let button = BlueWithShadowButton(type: .roundedRect)
        button.titleLabel?.numberOfLines = 0
        button.contentHorizontalAlignment = .left;
        button.titleEdgeInsets.left = 16.0
        button.setTitleAndFont(title: " Мои фильмы и\n сериалы", font: .boldSystemFont(ofSize: 20))
        button.addTarget(self, action: #selector(myMoviesButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let moviesInViewingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 80
        return tableView
    }()
    
    //MARK: Views size properties
    private let searchButtonHeight: CGFloat = 40.0
    private let addMyMoviesButtonHeight: CGFloat = 110.0
    private let MoviesInViewingTableViewHeight: CGFloat = 320.0
    
    //MARK: - Init
    init(frame: CGRect, container: ProfileViewsActions) {
        super.init(frame: frame)
        self.container = container
        self.backgroundColor = UIColor.AppColors.backgroundColor
        addSearrchMoviewButton()
        addMyMoviesButton()
        addForvardImage(in: myMoviesButton)
        addMoviesInViewingTableView()
        registerMoviesInViewingTableViewCell()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Select init with container")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setMoviesInViewingTableViewProvider(_ provider: TableViewProvider) {
        moviesInViewingTableView.delegate = provider
        moviesInViewingTableView.dataSource = provider
    }
    func reloadDataMoviesInViewingTableView() {
        moviesInViewingTableView.reloadData()
    }
    
    //MARK: - Private metods
    private func addSearrchMoviewButton() {
        addSubview(searchMoviesButton)
        
        NSLayoutConstraint.activate([
            searchMoviesButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: AppSizes.stdOffset),
            searchMoviesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppSizes.stdOffset),
            searchMoviesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -AppSizes.stdOffset),
            searchMoviesButton.heightAnchor.constraint(equalToConstant: searchButtonHeight)
        ])
    }
    
    private func addMyMoviesButton() {
        addSubview(myMoviesButton)
        NSLayoutConstraint.activate([
            myMoviesButton.topAnchor.constraint(equalTo: searchMoviesButton.bottomAnchor, constant: AppSizes.stdOffset),
            myMoviesButton.leadingAnchor.constraint(equalTo: searchMoviesButton.leadingAnchor),
            myMoviesButton.trailingAnchor.constraint(equalTo: searchMoviesButton.trailingAnchor),
            myMoviesButton.heightAnchor.constraint(equalToConstant: addMyMoviesButtonHeight)
        ])
    }
    
    private func addForvardImage(in view: UIView) {
        guard let image = UIImage(named: "next") else { return }
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image.withTintColor(.white)
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -AppSizes.stdOffset),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func addMoviesInViewingTableView() {
        addSubview(moviesInViewingTableView)
        NSLayoutConstraint.activate([
            moviesInViewingTableView.topAnchor.constraint(equalTo: myMoviesButton.bottomAnchor, constant: AppSizes.stdOffset),
            moviesInViewingTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            moviesInViewingTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            moviesInViewingTableView.heightAnchor.constraint(equalToConstant: MoviesInViewingTableViewHeight)
        ])
    }
    
    private func registerMoviesInViewingTableViewCell() {
        moviesInViewingTableView.register(
            MoviesInViewingTableViewCell.self,
            forCellReuseIdentifier: MoviesInViewingTableViewCell.reuseIdD)
        moviesInViewingTableView.register(
            MoviesInViewingTableViewHeader.self,
            forHeaderFooterViewReuseIdentifier: MoviesInViewingTableViewHeader.reuseIdD)
        moviesInViewingTableView.register(MoviesInViewingTableViewFooter.self, forHeaderFooterViewReuseIdentifier: MoviesInViewingTableViewFooter.reuseIdD)
    }
    
    //MARK: - ProfileViewsActions methods
    @objc private func searchMoviesButtonTapped() {
        container?.didPressedSearchMovieButton()
    }
    
    @objc private func myMoviesButtonTapped() {
        container?.didPressedMyMoviesButton()
    }
    
    
}


