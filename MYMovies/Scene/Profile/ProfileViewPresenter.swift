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
}

//получает от контроллера инфу о взаимодействии с UI
protocol ProfileViewPresentation: class {
    init(view: ProfileViewInterface,
         dataRepository: DataRepositoryProtocol,
         router: RouterProtocol)
    
    func actionButtonIsTapped()
}

final class ProfileViewPresenter: ProfileViewPresentation {
    weak var view: ProfileViewInterface?
    let dataRepository: DataRepositoryProtocol?
    let router: RouterProtocol?
    
    init(view: ProfileViewInterface, dataRepository: DataRepositoryProtocol, router: RouterProtocol) {
        self.view = view
        self.dataRepository = dataRepository
        self.router = router
    }
    
    func actionButtonIsTapped() {
        dataRepository?.giveResponse() { response in
            print(response)
        }
    }
    
    
    
}


