//
//  MovieService.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

protocol MovieService {

    func getPopularMovies(
        request: PopularMoviesRequest,
        onSuccess: @escaping (PopularMoviesResponse) -> Void,
        onFailure: @escaping (String) -> Void
    )
}
