//
//  MoviesInViewingTableViewCell.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 20.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

class MoviesInViewingTableViewCell: UITableViewCell, ReusableView {
    
    //MARK: - Private properties
    private var poster: UIImageView!
    private var movieTitle: UILabel!
    private var progressView: UIProgressView!
    private var breakPoint: UILabel!
    
    //MARK: Views size properties
    private let posterOffset: CGFloat = 5.0
    private let posterLeadingOffset: CGFloat = 24.0
    private let posterWidght: CGFloat = 50.0
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addPoster()
        addMovieTitle()
        addBreakPoint()
        addProgressView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Open metods
    func setPoster(_ name: String) {
        poster.image = UIImage(named: name)
    }
    
    func setTitles(title: String, subTitle: String) {
        movieTitle.text = title
        breakPoint.text = subTitle
    }
    
    //MARK: - Private metods
    private func addPoster() {
        //-------------------------------------------------------Убрать постер кастомный
        poster = UIImageView(image: UIImage(named: "vikings"))
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.layer.cornerRadius = 5
        poster.clipsToBounds = true
        
        contentView.addSubview(poster)
        NSLayoutConstraint.activate([
            poster.widthAnchor.constraint(equalToConstant: 50),
            poster.topAnchor.constraint(equalTo: self.topAnchor, constant: posterOffset),
            poster.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -posterOffset),
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
        ])
    }
    
    private func addMovieTitle() {
        movieTitle = UILabel(frame: .zero)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
        movieTitle.font = UIFont.boldSystemFont(ofSize: 17)
        
        contentView.addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: AppSizes.minOffset),
            movieTitle.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: AppSizes.minOffset),
            movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -AppSizes.stdOffset)
        ])
    }
    
    private func addProgressView() {
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0.5
        progressView.progressTintColor = UIColor.AppColors.primaryColor
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor),
            progressView.bottomAnchor.constraint(equalTo: breakPoint.topAnchor, constant: -AppSizes.minOffset)
        ])
    }
    
    private func addBreakPoint() {
        breakPoint = UILabel(frame: .zero)
        breakPoint.translatesAutoresizingMaskIntoConstraints = false
        breakPoint.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        contentView.addSubview(breakPoint)
        NSLayoutConstraint.activate([
            breakPoint.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -AppSizes.minOffset),
            breakPoint.leadingAnchor.constraint(equalTo: movieTitle.leadingAnchor),
            breakPoint.trailingAnchor.constraint(equalTo: movieTitle.trailingAnchor)
        ])
    }
    
    
    
}
