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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Поиск"
        
    }

}

extension SearchMovieViewController: SearchMovieViewInterface {
    
}
