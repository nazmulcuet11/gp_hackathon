//
//  ViewController.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let service: MovieService = MovieServiceRemote()

        let popularMoviesRequest = PopularMoviesRequest(
            primaryReleaseYear: "2020",
            sortBy: "vote_average.desc"
        )
        service.getPopularMovies(
            request: popularMoviesRequest,
            onSuccess: {
                (response) in
                print(response)
            }, onFailure: {
                (errorMessage) in
                print(errorMessage)
        })
    }
}

