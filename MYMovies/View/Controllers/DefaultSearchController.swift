//
//  CustomSearchController.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 19.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class DefaultSearchController: UISearchController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: searchResultsController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDefaulSettings(listener: UISearchResultsUpdating) {
        searchResultsUpdater = listener
        obscuresBackgroundDuringPresentation = false
        searchBar.placeholder = "Найти фильм или сериал"
    }
}
