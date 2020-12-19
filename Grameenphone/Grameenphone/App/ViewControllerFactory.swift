//
//  ViewControllerFactory.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class ViewControllerFactory {
    
    private let movieServiceRemote = MovieServiceRemote()
    private let tvSeriesServiceRemote = TVSeriesServiceRemote()

    func getHomeVC() -> UIViewController {
        let vc = HomeVC.instantiate()
        vc.movieService = movieServiceRemote
        vc.tvSeriesService = tvSeriesServiceRemote
        return vc
    }
}
