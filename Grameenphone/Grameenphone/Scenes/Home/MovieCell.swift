//
//  MovieCell.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {

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

    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        popularityLabel.text = String(format: "Popularity: %.2f", movie.popularity)
        voteLabel.text = "Vote: \(movie.voteAverage)"
        releaseDateLabel.text = "Released: \(movie.releaseDate)"
        languageLabel.text = "Language: \(movie.originalLanguage.description)"

        posterView.image = UIImage.photo
        if let url = URL(string: Constants.BaseImagePaths.poster + movie.posterPath) {
            posterView.kf.setImage(with: url)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupUI() {
        containerView.layer.cornerRadius = 4.0
        containerView.clipsToBounds = true
    }
}
