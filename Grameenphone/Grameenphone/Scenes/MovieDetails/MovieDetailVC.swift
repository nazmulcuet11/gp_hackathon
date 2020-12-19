//
//  MovieDetailVC.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class MovieDetailVC: UIViewController, StoryboardBased {

    // MARK: - Dependency

    var movieId: Int!
    var movieService: MovieService!

    // MARK: - Outlets

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var playTimeLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var addToFavoriteButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Private properties

    private var movieDetails: MovieDetails?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = AppStrings.movieDetailPageTitle

        loadData()
    }

    @IBAction func didTapAddToFavouritesButton(_ sender: Any) {

    }

    // MARK: - Helpers

    private func loadData() {

        activityIndicator.startAnimating()
        movieService.getMovieDetails(
            for: movieId,
            onSuccess: {
                (response) in

                self.activityIndicator.stopAnimating()
                self.movieDetails = response
                self.populateView()
            }, onFailure: {
                (errorMessage) in

                self.activityIndicator.stopAnimating()
                showAlert(title: "Failed", message: errorMessage, on: self)
            }
        )
    }

    private func populateView() {
        guard let movieDetails = movieDetails else { return }

        titleLabel.text = movieDetails.title
        popularityLabel.text = String(format: "Popularity: %.2f", movieDetails.popularity)

        if movieDetails.genres.count > 0 {
            var genres = movieDetails.genres.first?.name ?? ""
            movieDetails.genres.dropFirst().forEach {
                genres += ", \($0.name)"
            }
            genreLabel.text = "Genre: \(genres)"
        }
        if let runTime = movieDetails.runtime {
            playTimeLabel.text = "Play time: \(runTime)"
        }
        languageLabel.text = "Language: \(movieDetails.originalLanguage.description)"

        posterView.image = UIImage.photo
        if let url = URL(string: Constants.BaseImagePaths.poster + movieDetails.posterPath) {
            posterView.kf.setImage(with: url)
        }
    }
}
