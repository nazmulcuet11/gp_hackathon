//
//  MovieDetails.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

class TVSeriesDetails: Codable {
    let id: Int
    let name: String
    let originalLanguage, originalName, overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage, voteCount: Int
    let genres: [Genre]
    let inProduction: Bool
    let languages: [String]
    let numberOfEpisodes, numberOfSeasons: Int

    enum CodingKeys: String, CodingKey {
        case genres, id
        case inProduction = "in_production"
        case languages
        case name
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    init(genres: [Genre], id: Int, inProduction: Bool, languages: [String], name: String, numberOfEpisodes: Int, numberOfSeasons: Int, originalLanguage: String, originalName: String, overview: String, popularity: Double, posterPath: String, voteAverage: Int, voteCount: Int) {
        self.genres = genres
        self.id = id
        self.inProduction = inProduction
        self.languages = languages
        self.name = name
        self.numberOfEpisodes = numberOfEpisodes
        self.numberOfSeasons = numberOfSeasons
        self.originalLanguage = originalLanguage
        self.originalName = originalName
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
