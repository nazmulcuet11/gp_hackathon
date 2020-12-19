//
//  TrendingContentServiceRemote.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation
import Alamofire

fileprivate extension TrendingContentRequest {
    var endPoint: APIEndpoint {
        return APIEndpoint(
            method: .get,
            path: "/trending/all/week"
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

class TrendingContentService {
    func getTrendingContents(onSuccess: @escaping (TrendingContentResponse) -> Void, onFailure: @escaping (String) -> Void) {

        let request = TrendingContentRequest()
        APIClient.performRequest(router: request.router, completion: {
            (result: AFResult<TrendingContentResponse>) in

            switch result {
            case .success(let response):
                onSuccess(response)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        })
    }
}
