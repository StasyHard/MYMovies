//
//  ReusableView.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 23.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

extension ReusableView {
    static var reuseIdD: String {
        return String(describing: self)
    }
}
