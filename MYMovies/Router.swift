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
    func transitionToMyMoviesViewController()
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
            guard let mainViewController = assemblyBuilder?.createProfileModule(router: self)
                else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func transitionToMyMoviesViewController() {
        
    }
    
    
}
