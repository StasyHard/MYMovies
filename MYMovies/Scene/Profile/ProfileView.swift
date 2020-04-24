//
//  ProfileView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 20.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol ProfileViewsActions: class {
    func didPressedSearchMoviesButton()
    func didPressedMyMoviesButton()
}

class ProfileView: UIView {
    
    //MARK: - Open properties
    weak var container: ProfileViewsActions?
    
    //MARK: - Private properties
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
    private let stdOffset: CGFloat = 16.0
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
        
        NSLayoutConstraint(item: searchMoviesButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: safeAreaLayoutGuide,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: stdOffset).isActive = true
        NSLayoutConstraint(item: searchMoviesButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: stdOffset).isActive = true
        NSLayoutConstraint(item: searchMoviesButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: -stdOffset).isActive = true
        NSLayoutConstraint(item: searchMoviesButton,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: .none,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: searchButtonHeight).isActive = true
    }
    
    private func addMyMoviesButton() {
        addSubview(myMoviesButton)
        NSLayoutConstraint(item: myMoviesButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: searchMoviesButton,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: stdOffset).isActive = true
        NSLayoutConstraint(item: myMoviesButton,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: stdOffset).isActive = true
        NSLayoutConstraint(item: myMoviesButton,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: -stdOffset).isActive = true
        NSLayoutConstraint(item: myMoviesButton,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: .none,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: addMyMoviesButtonHeight).isActive = true
    }
    
    private func addForvardImage(in view: UIView) {
        guard let image = UIImage(named: "next") else { return }
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image.withTintColor(.white)

        view.addSubview(imageView)
        NSLayoutConstraint(item: imageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: -stdOffset).isActive = true
        NSLayoutConstraint(item: imageView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1.0,
                           constant: 0).isActive = true
    }
    
    private func addMoviesInViewingTableView() {
        addSubview(moviesInViewingTableView)
        NSLayoutConstraint(item: moviesInViewingTableView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: myMoviesButton,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: stdOffset).isActive = true
        NSLayoutConstraint(item: moviesInViewingTableView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: moviesInViewingTableView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: moviesInViewingTableView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: .none,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: MoviesInViewingTableViewHeight).isActive = true
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
        container?.didPressedSearchMoviesButton()
    }
    
    @objc private func myMoviesButtonTapped() {
        container?.didPressedMyMoviesButton()
    }
    
    
}


