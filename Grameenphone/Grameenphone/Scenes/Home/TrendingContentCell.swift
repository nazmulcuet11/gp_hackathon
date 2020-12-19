//
//  TrendingContentCell.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class TrendingContentCell: UITableViewCell {

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with trendingContent: TrendingContent) {
        titleLabel.text = trendingContent.title
        popularityLabel.text = String(format: "Popularity: %.2f", trendingContent.popularity)
        voteLabel.text = "Vote: \(trendingContent.voteAverage)"
        releaseDateLabel.text = "Released: \(trendingContent.releaseDate ?? "Unknown")"
        languageLabel.text = "Language: \(trendingContent.originalLanguage.description)"

        posterView.image = UIImage.photo
        if let url = URL(string: Constants.BaseImagePaths.poster + trendingContent.posterPath) {
            posterView.kf.setImage(with: url)
        }
    }

    private func setupUI() {
        containerView.layer.cornerRadius = 4.0
        containerView.clipsToBounds = true
    }
}
