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
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    func createProfileModule(router: RouterProtocol) -> UIViewController {
        let view = ProfileViewController()
        let networkServise = NetworkServise()
        let dataBase = DataBase()
        let dataRepository = DataRepository(networkServise: networkServise, dataBase: dataBase)
        let presenter = ProfileViewPresenter(view: view, dataRepository: dataRepository, router: router)
        view.presenter = presenter
        return view
    }
}
