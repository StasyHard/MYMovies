//
//  ProfilePresenter.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 16.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

//передает в контроллер информацию, когда нужно обновить UI
protocol ProfileViewInterface: class {
    func reloadDataInTableView()
    func setTableViewProvider(_ provider: TableViewProvider)
}

//получает от контроллера инфу о взаимодействии с UI
protocol ProfileViewPresentation: class {
    init(view: ProfileViewInterface,
         dataRepository: DataRepositoryProtocol,
         router: RouterProtocol)
    
    func myMoviesButtonIsTapped()
    func onViewDidLoad()
}

final class ProfileViewPresenter {
    
    //MARK: - Open properties
    private weak var view: ProfileViewInterface?
    private let dataRepository: DataRepositoryProtocol?
    private let router: RouterProtocol?
    
    private lazy var contentTableViewProvider: MoviesInViewingTableViewProvider = {
        let provider = MoviesInViewingTableViewProvider()
        view?.setTableViewProvider(provider)
        return provider
    }()
    
    
    var movies: [MovieInViewing]? {
        didSet {
            DispatchQueue.main.async {
                let moviesForProvider = [self.movies![0],self.movies![1],self.movies![2]]
                self.contentTableViewProvider.data = moviesForProvider
                self.view!.reloadDataInTableView()
            }
        }
    }
    
    
    
    //MARK: - Init
    init(view: ProfileViewInterface, dataRepository: DataRepositoryProtocol, router: RouterProtocol) {
        self.view = view
        self.dataRepository = dataRepository
        self.router = router
    }
}

//MARK: - ProfileViewPresentation protocol
extension ProfileViewPresenter: ProfileViewPresentation {
    
    func onViewDidLoad() {
        var movies = [MovieInViewing]()
        //-------------------------------------------------------------Временные данные
        dataRepository?.giveResponse() { response in
            //print(response)
            response.forEach {
                $0.map {
                    let newMovie = MovieInViewing(poster: $0.posterPath, title: $0.title, breakPoint: nil)
                    movies.append(newMovie)
                }
            }
                self.movies = movies
        }
    }
    
    func myMoviesButtonIsTapped() {
        
    }
}


