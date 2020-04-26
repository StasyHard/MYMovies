//
//  ProfileViewController.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 16.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: ProfileViewPresentation?
    
    //MARK: - Private properties
    private lazy var profileView = view as? ProfileView
    
     //MARK: - Life cycle
    override func loadView() {
        view = ProfileView(frame: UIScreen.main.bounds, container: self)
        //устаноовить делегата
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        setupSettingsButton()
        
//        //---------------------------------------------------------------Временные меры
//        let provider = MoviesInViewingTableViewProvider()
//        setTableViewProvider(provider)
        //reloadDataInTableView()
        presenter?.onViewDidLoad()
    }
    
    //MARK: - Private metods
    private func setupSettingsButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Настройки", style: .plain, target: self, action: #selector(settingsButtonTapped))
    }
    
    
    @objc private func settingsButtonTapped() {
        print("settingsButtonTapped")
        presenter?.myMoviesButtonIsTapped()
    }
}

//MARK: - ProfileViewInterface protocol
extension ProfileViewController: ProfileViewInterface {
    
    func reloadDataInTableView() {
        profileView?.reloadDataMoviesInViewingTableView()
    }
    
    func setTableViewProvider(_ provider: TableViewProvider) {
        profileView?.setMoviesInViewingTableViewProvider(provider)
    }
}

//MARK: - ProfileViewsActions protocol
extension ProfileViewController: ProfileViewsActions {
    func didPressedMyMoviesButton() {
        presenter?.myMoviesButtonIsTapped()
    }
    
    func didPressedSearchMovieButton() {
        presenter?.searchMovieButtonIsTapped()
    }
}




