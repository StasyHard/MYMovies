//
//  MyMoviesViewController.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 24.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MyMoviesViewController: UIViewController {
    
    //MARK: - Open properties
    var presenter: MyMoviesPresentation?
    
    //MARK: - Private properties
    private lazy var myMoviesView = view as? MyMoviesView
    
    //MARK: - Life cycle
    override func loadView() {
        view = MyMoviesView(frame: UIScreen.main.bounds, container: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MyMoviesViewController: MyMoviesViewInterface {
    func reloadDataInTableView() {
        myMoviesView?.reloadDataMoviesInViewingTableView()
    }
    
    func setTableViewProvider(_ provider: TableViewProvider) {
        myMoviesView?.setMyMoviesTableViewProvider(provider)
    }
}

extension MyMoviesViewController: MyMoviesViewsActions {
    
}
