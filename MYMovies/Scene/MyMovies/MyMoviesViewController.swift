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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

      
    }

}

extension MyMoviesViewController: MyMoviesViewInterface {
    
}
