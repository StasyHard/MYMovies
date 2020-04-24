//
//  MoviesInViewingTableViewHeader.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 22.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MoviesInViewingTableViewHeader: UITableViewHeaderFooterView, ReusableView {
    
    //MARK: - Open properties    
    static var headerHeight: CGFloat {
        return 40.0
    }
    
    //MARK: - Private properties
    private var title: UILabel!
    private var appendMovieButton: BlueTextWithoutBackgroundButton!
    
    //MARK: - Init    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor.AppColors.sectionColor
        addTitle()
        addAppendMovieButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private metods
    private func addTitle() {
        title = UILabel()
        title.text = "Смотрю сейчас"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppSizes.stdOffset),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func addAppendMovieButton() {
        appendMovieButton = BlueTextWithoutBackgroundButton(type: .system)
        appendMovieButton.setTitleAndFont(title: "Добавить", font: UIFont.systemFont(ofSize: 17))
        
        addSubview(appendMovieButton)
        NSLayoutConstraint.activate([
            appendMovieButton.leadingAnchor.constraint(greaterThanOrEqualTo: title.trailingAnchor, constant: AppSizes.minOffset),
            appendMovieButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -AppSizes.stdOffset),
            appendMovieButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
