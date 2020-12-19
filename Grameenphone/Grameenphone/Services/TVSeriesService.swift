//
//  TVSeriesService.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

protocol TVSeriesService {
    func getPopularTVSeries(
        request: PopularTVSeriesRequest,
        onSuccess: @escaping (PopularTVSeriesResponse) -> Void,
        onFailure: @escaping (String) -> Void
    )
}
