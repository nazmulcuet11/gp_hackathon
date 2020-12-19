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
    private let favouriteItemsStore = FavouriteItemsSotre()

    func getHomeVC() -> UIViewController {
        let vc = HomeVC.instantiate()
        vc.factory = self
        vc.movieService = movieService
        vc.tvSeriesService = tvSeriesService
        vc.trendinContentService = trendingContentService
        return vc
    }

    func getMovieDetailVC(for movie: Movie) -> UIViewController {
        let vc = MovieDetailVC.instantiate()
        vc.movie = movie
        vc.movieService = movieService
        vc.store = favouriteItemsStore
        return vc
    }

    func getTVSeriesDetailVC(for tvSeries: TVSeries) -> UIViewController {
        let vc = TVSeriesDetailsVC.instantiate()
        vc.tvSeries = tvSeries
        vc.service = tvSeriesService
        vc.store = favouriteItemsStore
        return vc
    }

    func getFavouriteItemsVC() -> UIViewController {
        let vc = FavouriteItemsVC.instantiate()
        vc.store = favouriteItemsStore
        return vc
    }
}
