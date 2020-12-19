//
//  MovieService.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation
import Alamofire

fileprivate extension PopularMoviesRequest {
    var endPoint: APIEndpoint {
        return APIEndpoint(
            method: .get,
            path: "/discover/movie"
        )
    }

    var parmaeters: Parameters? {
        return try? self.asDictionary()
    }

    var router: APIRouter {
        return APIRouter(
            endpoint: endPoint,
            parameters: parmaeters,
            bodyData: nil
        )
    }
}

class MovieService {

    func getPopularMovies(
        request: PopularMoviesRequest,
        onSuccess: @escaping (PopularMoviesResponse) -> Void,
        onFailure: @escaping (String) -> Void
    ) {

        APIClient.performRequest(router: request.router, completion: {
            (result: AFResult<PopularMoviesResponse>) in

            switch result {
            case .success(let response):
                onSuccess(response)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        })
    }

    func getMovieDetails(
        for movieId: Int,
        onSuccess: @escaping (MovieDetails) -> Void,
        onFailure: @escaping (String) -> Void
    ) {

        let endPoint = APIEndpoint(
            method: .get,
            path: "/movie/\(movieId)"
        )

        let parmaeters = ["api_key": Constants.Server.apiKey]

        let router = APIRouter(
            endpoint: endPoint,
            parameters: parmaeters,
            bodyData: nil
        )

        APIClient.performRequest(router: router, completion: {
            (result: AFResult<MovieDetails>) in

            switch result {
            case .success(let response):
                onSuccess(response)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        })
    }
}
