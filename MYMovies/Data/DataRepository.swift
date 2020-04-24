//
//  DataBase.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 16.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

//получает инфу от презентера, когда нужно обновить модель
protocol DataRepositoryProtocol {
    init(networkServise: NetworkServiseProtocol, dataBase: DataBaseProtocol)
    func giveResponse(complition: @escaping ([Movie?]) -> Void)
}

final class DataRepository: DataRepositoryProtocol {
    
    private var networkServise: NetworkServiseProtocol?
    private var dataBase: DataBaseProtocol?
    
    init(networkServise: NetworkServiseProtocol, dataBase: DataBaseProtocol) {
        self.networkServise = networkServise
        self.dataBase = dataBase
    }
    
    func giveResponse(complition: @escaping ([Movie?]) -> Void) {
        networkServise?.findMovies() { movies in
                complition(movies)
        }
    }
}

