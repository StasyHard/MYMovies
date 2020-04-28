//
//  MyMoviesPresenter.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 24.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

protocol MyMoviesViewInterface: class {
    func setTableViewProvider(_ provider: TableViewProvider)
    func reloadDataInTableView()
}

protocol MyMoviesPresentation: class {
    init(view: MyMoviesViewInterface,
         dataRepository: DataRepositoryProtocol,
         router: RouterProtocol)
}

final class MyMoviesPresenter: MyMoviesPresentation {
    private weak var view: MyMoviesViewInterface?
    private let dataRepository: DataRepositoryProtocol?
    private let router: RouterProtocol?
    
    private lazy var contentTableViewProvider: MyMoviesTableViewProvider = {
        let provider = MyMoviesTableViewProvider()
        view?.setTableViewProvider(provider)
        return provider
    }()
    
    
        //MARK: - Init
    init(view: MyMoviesViewInterface, dataRepository: DataRepositoryProtocol, router: RouterProtocol) {
           self.view = view
           self.dataRepository = dataRepository
           self.router = router
        
        contentTableViewProvider.data = [
            MovieInViewing(poster: "vikings", title: "Викинги", breakPoint: "1 сезон 4 серия"),
            MovieInViewing(poster: "vikings", title: "Однажды в Ирландии", breakPoint: "1 час 41 мин"),
            MovieInViewing(poster: "vikings", title: "Звездные воины: Скайуокер. Восход. Ldf", breakPoint: "1 час 41 мин")
        ]
        view.reloadDataInTableView()
       }
    
}

extension MyMoviesPresenter  {

    
    
}
