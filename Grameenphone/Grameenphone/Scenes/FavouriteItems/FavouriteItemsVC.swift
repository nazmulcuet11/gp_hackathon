//
//  FauvoriteItemsVC.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class FavouriteItemsVC: UIViewController, StoryboardBased {

    var store: FavouriteItemsSotre!
    var factory: ViewControllerFactory!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = AppStrings.favouriteItemsVCTitle

        tableView.separatorStyle = .none

        tableView.registerNibCell(FavMovieCell.self)
        tableView.registerNibCell(FavTVSeriesCell.self)

        tableView.registerNibHeaderFooter(HomeSceneTableHeaderView.self)

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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

extension FavouriteItemsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionTypes.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionTypes.allCases[section]
        switch sectionType {
        case .movie:
            return store.movies.count
        case .tvSeries:
            return store.tvSerieses.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = SectionTypes.allCases[indexPath.section]
        switch sectionType {
        case .movie:
            let cell = tableView.dequeueReusableCell(FavMovieCell.self, for: indexPath)
            let movie = store.movies[indexPath.row]
            cell.configure(with: movie)
            return cell
        case .tvSeries:
            let cell = tableView.dequeueReusableCell(FavTVSeriesCell.self, for: indexPath)
            let tvSeries = store.tvSerieses[indexPath.row]
            cell.configure(with: tvSeries)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = SectionTypes.allCases[section]
        let view = tableView.dequeueReusableHeaderFooterView(HomeSceneTableHeaderView.self)
        view.setTitle(sectionType.title)
        return view
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        let sectionType = SectionTypes.allCases[indexPath.section]
        switch sectionType {
        case .movie:
            let movie = store.movies[indexPath.row]
            let vc = factory.getMovieDetailVC(for: movie)
            navigationController?.pushViewController(vc, animated: true)
        case .tvSeries:
            let tvSeries = store.tvSerieses[indexPath.row]
            let vc = factory.getTVSeriesDetailVC(for: tvSeries)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
