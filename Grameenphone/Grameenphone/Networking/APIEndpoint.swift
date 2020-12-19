//
//  APIRouter.swift
//  evaly-ios
//
//  Created by Nazmul Islam on 5/5/20.
//  Copyright © 2020 Nazmul Islam. All rights reserved.
//

import Foundation
import Alamofire

struct APIEndpoint {
    var method: HTTPMethod
    var path: String
    var contentType: HTTPContentType? =  .json
}

struct APIRouter: URLRequestConvertible, URLConvertible  {
    let endpoint: APIEndpoint
    let parameters: Parameters?
    let bodyData: Data?
}

extension APIRouter {
    /// Encode complex key/value objects in URLQueryItem pairs
    private func queryItems(_ key: String, _ value: Any?) -> [URLQueryItem] {
        var result = [] as [URLQueryItem]
        if let dictionary = value as? [String: AnyObject] {
            for (nestedKey, value) in dictionary {
                result += queryItems("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [AnyObject] {
            let arrKey = key
            for value in array {
                result += queryItems(arrKey, value)
            }
        } else if let value = value {
            result.append(URLQueryItem(name: key, value: "\(value)"))
        } else {
            result.append(URLQueryItem(name: key, value: nil))
        }

        return result
    }

    /// Encodes complex [String: AnyObject] params into array of URLQueryItem
    private func paramsToQueryItems(_ params: [String: Any]?) -> [URLQueryItem]? {
        guard let params = params else { return nil }
        var result = [] as [URLQueryItem]
        for (key, value) in params {
            result += queryItems(key, value)
        }
        return result
    }

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: Constants.Server.baseURL + endpoint.path)!
        if let parameters = parameters, let items = paramsToQueryItems(parameters) {
            urlComponents.queryItems = items
        }

        var urlRequest = URLRequest(url: urlComponents.url!)
        if let bodyData = bodyData {
            urlRequest.httpBody = bodyData
        }

        // HTTP Method
        urlRequest.httpMethod = endpoint.method.rawValue

        // Common Headers
        urlRequest.setValue(HTTPContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        if let contentType = endpoint.contentType {
            urlRequest.setValue(contentType.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        }
        return urlRequest
    }

    // MARK: - URLConvertible
    func asURL() throws -> URL {
        let url = URL(string: Constants.Server.baseURL + endpoint.path)!
        return url
    }
}
