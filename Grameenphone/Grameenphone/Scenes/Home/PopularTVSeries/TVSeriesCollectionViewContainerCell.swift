//
//  TVSeriesCollectionViewContainerCell.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class TVSeriesCollectionViewContainerCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var serieses = [TVSeries]()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with serieses: [TVSeries], loading: Bool) {
        if loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }

        self.serieses = serieses
        collectionView.reloadData()
    }

    private func setupUI() {
        collectionView.registerNibCell(TVSeriesCell.self)

        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension TVSeriesCollectionViewContainerCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serieses.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(TVSeriesCell.self, for: indexPath)
        let series = serieses[indexPath.row]
        cell.configure(with: series)
        return cell
    }
}

extension TVSeriesCollectionViewContainerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 200)
    }
}

