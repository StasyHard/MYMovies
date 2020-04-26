//
//  MyMoviesPresenter.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 24.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

protocol MyMoviesViewInterface: class { }

protocol MyMoviesPresentation: class {
    init(view: MyMoviesViewInterface,
         dataRepository: DataRepositoryProtocol,
         router: RouterProtocol)
}

final class MyMoviesPresenter: MyMoviesPresentation {
    private weak var view: MyMoviesViewInterface?
    private let dataRepository: DataRepositoryProtocol?
    private let router: RouterProtocol?
    
        //MARK: - Init
    init(view: MyMoviesViewInterface, dataRepository: DataRepositoryProtocol, router: RouterProtocol) {
           self.view = view
           self.dataRepository = dataRepository
           self.router = router
       }
    
}

extension MyMoviesPresenter  {

    
    
}
