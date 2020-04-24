//
//  MovieModel.swift
//  MYMovies
//
//  Created by Anastasia Reyngardt on 17.04.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import Foundation

struct MoviesResponse: Decodable {
    //let page, totalResults, totalPages: Int
    let results: [MovieResponse]

    enum CodingKeys: String, CodingKey {
//        case page
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
          case results
    }
}

struct MovieResponse: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case popularity, id, video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case posterPath = "poster_path"
    }
    
    func mapToMovie() -> Movie {
        let movie = Movie(popularity: self.popularity,
                          id: self.id,
                          video: self.video,
                          voteCount: self.voteCount,
                          voteAverage: self.voteAverage,
                          title: self.title,
                          releaseDate: self.releaseDate,
                          originalLanguage: self.originalLanguage,
                          originalTitle: self.originalTitle,
                          genreIDS: self.genreIDS,
                          backdropPath: self.backdropPath,
                          adult: self.adult,
                          overview: self.overview,
                          posterPath: self.posterPath)
        return movie
    }
}
