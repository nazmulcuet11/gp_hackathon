//
//  PopularTVSeriesRequest.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

struct PopularTVSeriesRequest: Codable {
    let apiKey: String = Constants.Server.apiKey
    let primaryReleaseYear: String
    let sortBy: String

    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case primaryReleaseYear = "primary_release_year"
        case sortBy = "sort_by"
    }
}
