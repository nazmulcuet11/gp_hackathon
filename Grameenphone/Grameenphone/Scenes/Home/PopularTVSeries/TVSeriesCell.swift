//
//  TVSeriesCell.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class TVSeriesCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    func configure(with series: TVSeries) {
        titleLabel.text = series.name
        popularityLabel.text = String(format: "Popularity: %.2f", series.popularity)
        voteLabel.text = "Vote: \(series.voteAverage)"
        releaseDateLabel.text = "Released: \(series.firstAirDate)"
        languageLabel.text = "Language: \(series.originalLanguage.description)"

        posterView.image = UIImage.photo
        if let posterPath = series.posterPath,
           let url = URL(string: Constants.BaseImagePaths.poster +  posterPath) {
            posterView.kf.setImage(with: url)
        }
    }

    private func setupUI() {
        containerView.layer.cornerRadius = 4.0
        containerView.clipsToBounds = true
    }
}
