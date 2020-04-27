//
//  BlueButtonWithShadow.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 20.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class BlueWithShadowButton: UIButton {
    
        //MARK: - Private properties
    private let cornerRadius: CGFloat = 5.0
    private let shadowOffset: CGFloat = 2
    private let shadowOpacity: Float = 5.0
    
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
    }
    
    //MARK: - Private metods
    private func setupUI() {
        backgroundColor = UIColor.AppColors.primaryColor
        layer.cornerRadius = cornerRadius
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: shadowOffset, height: shadowOffset)
        layer.shadowOpacity = shadowOpacity
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
