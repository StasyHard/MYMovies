//
//  Movie.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 17.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

struct Movie {
    let popularity: Double
    let id: Int
    let video: Bool
    let voteCount: Int
    let voteAverage: Double
    let title, releaseDate, originalLanguage, originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, posterPath: String
}
