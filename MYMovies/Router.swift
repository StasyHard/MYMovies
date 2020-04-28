//
//  Router.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 16.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol RouterMain {
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol)
}

protocol RouterProtocol: RouterMain {
    func transitionToInitialViewController()
    func transitionToMyMovies()
    func transitionToSearchMovie(from vc: UIViewController)
}

final class Router: RouterProtocol {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private var assemblyBuilder: AssemblyBuilderProtocol?
    
    //MARK: - LifeCycle
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    //MARK: - Metods
    func transitionToInitialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?
                .createProfileModule(router: self)
                else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func transitionToSearchMovie(from vc: UIViewController) {
        guard let searchMovieViewController = assemblyBuilder?.createSearchMovieModule(router: self)
            else { return }
        let navViewController = UINavigationController(rootViewController: searchMovieViewController)
        vc.navigationController?.present(navViewController,
                                         animated: true,
                                         completion: nil)
    }
    
    func transitionToMyMovies() {
        if let navigationController = navigationController {
            guard let myMoviewViewController = assemblyBuilder?
                .createMyMoviesModule(router: self)
                else { return }
            navigationController.pushViewController(myMoviewViewController,
                                                    animated: true)
        }
    }
    

    
}
