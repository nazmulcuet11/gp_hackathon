//
//  FauvoriteItemsVC.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class FavouriteItemsVC: UIViewController, StoryboardBased {

    var store: FavouriteItemsSotre!

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.registerNibCell(MovieCell.self)
        collectionView.registerNibCell(TVSeriesCell.self)

        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension FavouriteItemsVC {
    enum SectionTypes: CaseIterable {
        case movie
        case tvSeries

        var title: String {
            switch self {
            case .movie:
                return "Favourite Movies"
            case .tvSeries:
                return "Favourite TV Series"
            }
        }
    }
}

extension FavouriteItemsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = SectionTypes.allCases[section]
        switch sectionType {
        case .movie:
            return store.movies.count
        case .tvSeries:
            return store.tvSerieses.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let sectionType = SectionTypes.allCases[indexPath.section]
        switch sectionType {
        case .movie:
            let cell = collectionView.dequeueReusableCell(MovieCell.self, for: indexPath)
            let movie = store.movies[indexPath.row]
            cell.configure(with: movie)
            return cell
        case .tvSeries:
            let cell = collectionView.dequeueReusableCell(TVSeriesCell.self, for: indexPath)
            let tvSeries = store.tvSerieses[indexPath.row]
            cell.configure(with: tvSeries)
            return cell
        }
    }
}

extension FavouriteItemsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width - 48
        return CGSize(width: width, height: 220)
    }
}
