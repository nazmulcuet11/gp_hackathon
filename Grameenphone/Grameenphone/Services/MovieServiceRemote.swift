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

class MovieServiceRemote: MovieService {

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
}
