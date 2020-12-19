//
//  ViewControllerFactory.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class ViewControllerFactory {
    
    private let movieServiceRemote = MovieServiceRemote()

    func getHomeVC() -> UIViewController {
        let vc = HomeVC.instantiate()
        vc.movieService = movieServiceRemote
        return vc
    }
}
