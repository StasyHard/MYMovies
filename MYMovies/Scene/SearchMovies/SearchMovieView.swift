//
//  SearchMovieView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol SearchMovieViewsActions: class {
    
}

class SearchMovieView: UIView {
    
    //MARK: - Private properties
    private weak var container: SearchMovieViewsActions?
    
    //MARK: - Init
    init(frame: CGRect, container: SearchMovieViewsActions) {
        super.init(frame: frame)
        self.container = container
        self.backgroundColor = UIColor.AppColors.backgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("Select init with container")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
