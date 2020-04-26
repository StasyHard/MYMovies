//
//  AssemblyBuilder.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 16.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createProfileModule(router: RouterProtocol) -> UIViewController
    func createMyMoviesModule(router: RouterProtocol) -> UIViewController
    func createSearchMovieModule(router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    
    let networkServise = TmdbNetworkServise()
    let dataBase = MyMoviesDataBase()
    lazy var dataRepository = DataRepository(networkServise: networkServise, dataBase: dataBase)
    
    func createProfileModule(router: RouterProtocol) -> UIViewController {
        let view = ProfileViewController()
        let presenter = ProfileViewPresenter(view: view, dataRepository: dataRepository, router: router)
        view.presenter = presenter
        return view
    }
    
    func createMyMoviesModule(router: RouterProtocol) -> UIViewController {
        let view = MyMoviesViewController()
        let presenter = MyMoviesPresenter(view: view, dataRepository: dataRepository, router: router)
        view.presenter = presenter
        return view
    }
    func createSearchMovieModule(router: RouterProtocol) -> UIViewController {
        let view = SearchMovieViewController()
        let presenter = SearchMoviePresenter(view: view, dataRepository: dataRepository, router: router)
        view.presenter = presenter
        return view
    }
}
