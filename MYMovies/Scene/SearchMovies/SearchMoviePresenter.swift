//
//  SearchMoviesPresenter.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

protocol SearchMovieViewInterface: class {
    func setTableViewProvider(_ provider: TableViewProvider)
    func reloadDataInTableView()
}

protocol SearchMoviePresentation: class {
    init(view: SearchMovieViewInterface,
         dataRepository: DataRepositoryProtocol,
         router: RouterProtocol)
}

class SearchMoviePresenter {
    private weak var view: SearchMovieViewInterface?
    private let dataRepository: DataRepositoryProtocol?
    private let router: RouterProtocol?
    
    private lazy var contentTableViewProvider: SearchMovietableViewProvider = {
        let provider = SearchMovietableViewProvider()
        view?.setTableViewProvider(provider)
        return provider
    }()
    
    //MARK: - Init
    init(view: SearchMovieViewInterface, dataRepository: DataRepositoryProtocol, router: RouterProtocol) {
        self.view = view
        self.dataRepository = dataRepository
        self.router = router
        
        contentTableViewProvider.data = ["Популярные фильмы", "Популярные сериалы", "Новые фильмы", "Новые сериалы"]
        view.reloadDataInTableView()
    }
}

extension SearchMoviePresenter {
    
}
