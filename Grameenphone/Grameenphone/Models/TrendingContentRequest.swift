//
//  TrendingContentRequest.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

struct TrendingContentRequest: Codable {
    let apiKey: String = Constants.Server.apiKey

    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
}
