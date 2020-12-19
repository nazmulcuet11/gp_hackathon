//
//  Constants.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

enum Constants {
    enum Server {
        private static let apiVersion = 3
        static let baseURL = "https://api.themoviedb.org/\(apiVersion)"
        static let apiKey = "1a97f3b8d5deee1d649c0025f3acf75c"
    }

    enum BaseImagePaths {
        static let poster = "https://image.tmdb.org/t/p/w342"
        static let backdrop = "https://image.tmdb.org/t/p/w780"
        static let logo = "https://image.tmdb.org/t/p/w300"
        static let cast =  "https://image.tmdb.org/t/p/h632"
    }
}
