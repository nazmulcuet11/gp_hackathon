//
//  TrendingContent.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

class TrendingContent: Codable {
    let video: Bool?
    let voteAverage: Double
    let overview: String
    let releaseDate: String?
    let voteCount: Int
    let adult: Bool?
    let backdropPath: String
    let title: String?
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: Language
    let originalTitle: String?
    let posterPath: String
    let popularity: Double
    let mediaType: MediaType
    let originalName: String?
    let originCountry: [String]?
    let firstAirDate, name: String?

    enum CodingKeys: String, CodingKey {
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case adult
        case backdropPath = "backdrop_path"
        case title
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case popularity
        case mediaType = "media_type"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case name
    }

    init(video: Bool?, voteAverage: Double, overview: String, releaseDate: String?, voteCount: Int, adult: Bool?, backdropPath: String, title: String?, genreIDS: [Int], id: Int, originalLanguage: Language, originalTitle: String?, posterPath: String, popularity: Double, mediaType: MediaType, originalName: String?, originCountry: [String]?, firstAirDate: String?, name: String?) {
        self.video = video
        self.voteAverage = voteAverage
        self.overview = overview
        self.releaseDate = releaseDate
        self.voteCount = voteCount
        self.adult = adult
        self.backdropPath = backdropPath
        self.title = title
        self.genreIDS = genreIDS
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.popularity = popularity
        self.mediaType = mediaType
        self.originalName = originalName
        self.originCountry = originCountry
        self.firstAirDate = firstAirDate
        self.name = name
    }
}

