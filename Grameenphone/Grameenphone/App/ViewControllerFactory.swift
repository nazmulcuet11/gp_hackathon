//
//  ViewControllerFactory.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class ViewControllerFactory {
    
    private let movieService = MovieService()
    private let tvSeriesService = TVSeriesService()
    private let trendingContentService = TrendingContentService()

    func getHomeVC() -> UIViewController {
        let vc = HomeVC.instantiate()
        vc.movieService = movieService
        vc.tvSeriesService = tvSeriesService
        vc.trendinContentService = trendingContentService
        return vc
    }
}
