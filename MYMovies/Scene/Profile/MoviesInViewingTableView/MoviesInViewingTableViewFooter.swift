//
//  MoviesInViewingTableViewFooter.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 23.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MoviesInViewingTableViewFooter: UITableViewHeaderFooterView, ReusableView {
    
    //MARK: - Open properties
    static var footerHeight: CGFloat {
        return 40.0
    }
    
    //MARK: - Private properties
    var showMoreButton: BlueTextWithoutBackgroundButton!
    
    //MARK: - Init
      override init(reuseIdentifier: String?) {
          super.init(reuseIdentifier: reuseIdentifier)
          
        contentView.backgroundColor = UIColor.AppColors.sectionColor
        addShowMoreButton()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    //MARK: - Private metods
    private func addShowMoreButton() {
        showMoreButton = BlueTextWithoutBackgroundButton(type: .system)
        showMoreButton.setTitleAndFont(title: "Показать больше ",
                               font:  UIFont.systemFont(ofSize: 15))
        showMoreButton.setImage(UIImage(named: "next"), for: .normal)
        showMoreButton.semanticContentAttribute = .forceRightToLeft
        
        
        addSubview(showMoreButton)
        NSLayoutConstraint.activate([
            showMoreButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: AppSizes.stdOffset),
            showMoreButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ])
    }
    
}
