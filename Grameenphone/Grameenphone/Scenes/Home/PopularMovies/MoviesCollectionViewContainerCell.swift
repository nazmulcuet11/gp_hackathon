//
//  MoviesCollectionViewContainerCell.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

protocol MovieSelectionDelegate: class {
    func didSelectMovie(_ movie: Movie)
}

class MoviesCollectionViewContainerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var movies = [Movie]()
    private weak var delegate: MovieSelectionDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with movies: [Movie], loading: Bool, delegate: MovieSelectionDelegate?) {

        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }

        self.delegate = delegate
        self.movies = movies
        self.collectionView.reloadData()
    }

    private func setupUI() {
        collectionView.registerNibCell(MovieCell.self)

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension MoviesCollectionViewContainerCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(MovieCell.self, for: indexPath)
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        delegate?.didSelectMovie(movie)
    }
}

extension MoviesCollectionViewContainerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 200)
    }
}
