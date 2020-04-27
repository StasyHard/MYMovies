//
//  SearchTableViewCell.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 26.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell, ReusableView {

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
