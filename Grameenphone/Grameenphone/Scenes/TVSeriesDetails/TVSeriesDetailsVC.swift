//
//  TVSeriesDetailsVC.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class TVSeriesDetailsVC: UIViewController, StoryboardBased {

    // MARK: - Dependency

    var tvSeries: TVSeries!
    var service: TVSeriesService!
    var store: FavouriteItemsSotre!

    // MARK: - Outlets

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var addToFavoriteButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var tvSeriesDetails: TVSeriesDetails?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = AppStrings.tvSeriesDetailPageTitle

        setFavButtonTitle()

        loadData()
    }

    @IBAction func didTapAddToFavouritesButton(_ sender: Any) {
        if store.isFavouriteTVSeries(tvSeries) {
            store.removeTVSeries(tvSeries)
        } else {
            store.addTVSeries(tvSeries)
        }
        setFavButtonTitle()
    }
    
    private func setFavButtonTitle() {
        if store.isFavouriteTVSeries(tvSeries) {
            addToFavoriteButton.setTitle("Remove from favourite", for: .normal)
        } else {
            addToFavoriteButton.setTitle("Add to favourite", for: .normal)
        }
    }

    private func loadData() {

        activityIndicator.startAnimating()
        service.getTVSeriesDetails(
            for: tvSeries.id,
            onSuccess: {
                (response) in

                self.activityIndicator.stopAnimating()
                self.tvSeriesDetails = response
                self.populateView()
            }, onFailure: {
                (errorMessage) in

                self.activityIndicator.stopAnimating()
                showAlert(title: "Failed", message: errorMessage, on: self)
            }
        )
    }

    private func populateView() {
        guard let details = tvSeriesDetails else { return }

        titleLabel.text = details.name
        overViewLabel.text = details.overview
        popularityLabel.text = String(format: "Popularity: %.2f", details.popularity)

        if details.genres.count > 0 {
            var genres = details.genres.first?.name ?? ""
            details.genres.dropFirst().forEach {
                genres += ", \($0.name)"
            }
            genreLabel.text = "Genre: \(genres)"
        }
        seasonEpisodeLabel.text = "Season: \(details.numberOfSeasons), Episode: \(details.numberOfEpisodes)"
        languageLabel.text = "Language: \(details.originalLanguage.description)"

        posterView.image = UIImage.photo
        if let posterPath = details.posterPath,
           let url = URL(string: Constants.BaseImagePaths.poster + posterPath) {
            posterView.kf.setImage(with: url)
        }
    }
}
