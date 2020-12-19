//
//  MovieDetails.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

class MovieDetails: Codable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage, voteCount: Int
    let budget: Int?
    let genres: [Genre]
    let revenue, runtime: Int?
    let status, tagline: String
    

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime, status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    init(adult: Bool, backdropPath: String, budget: Int, genres: [Genre], id: Int, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: String, revenue: Int, runtime: Int, status: String, tagline: String, title: String, video: Bool, voteAverage: Int, voteCount: Int) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.budget = budget
        self.genres = genres
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}


