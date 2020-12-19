//
//  TVSeriesServiceRemote.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation
import Alamofire

fileprivate extension PopularTVSeriesRequest {
    var endPoint: APIEndpoint {
        return APIEndpoint(
            method: .get,
            path: "/discover/tv"
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

class TVSeriesService {
    func getPopularTVSeries(
        request: PopularTVSeriesRequest,
        onSuccess: @escaping (PopularTVSeriesResponse) -> Void,
        onFailure: @escaping (String) -> Void) {

        APIClient.performRequest(router: request.router, completion: {
            (result: AFResult<PopularTVSeriesResponse>) in

            switch result {
            case .success(let response):
                onSuccess(response)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        })
    }
}
