//
//  SearchMoviesiewController.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchMovieViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: SearchMoviePresenter?
    
    //MARK: - Private properties
    private lazy var profileView = view as? SearchMovieView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavigationItem()
    }
    
    private func setupNavigationItem() {
        view.backgroundColor = .white
        title = "Поиск"
    }

}

extension SearchMovieViewController: SearchMovieViewInterface {
    
}
