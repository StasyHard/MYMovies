//
//  BlueTextWithoutBackgroundButton.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 23.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class BlueTextWithoutBackgroundButton: UIButton {
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setTitleAndFont(title: String, font: UIFont) {
        setTitle(title, for: .normal)
        titleLabel?.font = font
        tintColor = .white
        
        tintColor = .systemBlue
    }
    
    //MARK: - Private metods
    private func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
