//
//  SearchMoviesiewController.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchMovieViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: SearchMoviePresenter?
    
    //MARK: - Private properties
    private lazy var searchMovieView = view as? SearchMovieView
    
    override func loadView() {
           view = SearchMovieView(frame: UIScreen.main.bounds, container: self)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavigationItem()
        
        //---------------------------------------------------------------------Временно
//        let provider = SearchMovietableViewProvider()
//        searchMovieView?.setSearchMovietableViewProvider(provider)
        //searchMovieView?.setSearchControllerProvider(self)
    }
    
    private func setupNavigationItem() {
        title = "Поиск"
    }

}

extension SearchMovieViewController: SearchMovieViewInterface {
    func setTableViewProvider(_ provider: TableViewProvider) {
        searchMovieView?.setSearchMovietableViewProvider(provider)
    }
    
    func reloadDataInTableView() {
        searchMovieView?.reloadDataSearchMovietableView()
    }
    
    
}

extension SearchMovieViewController: SearchMovieViewsActions {
    
}

extension SearchMovieViewController: SearchTableViewProvider {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("Введен текст")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMovieView?.reloadDataSearchMovietableView()
    }
    
}
