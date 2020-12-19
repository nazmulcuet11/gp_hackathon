//
//  ViewController.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class HomeVC: UIViewController, StoryboardBased {

    // MARK: - Dependency

    var movieService: MovieService!

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Private properties

    private var movies = [Movie]()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = AppStrings.homePageTitle

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200.0

        tableView.registerNibCell(MovieCell.self)
        tableView.registerNibHeaderFooter(HomeSceneTableHeaderView.self)

        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self

        loadData()
    }

    // MARK: - Helpers

    private func loadData() {

        activityIndicator.startAnimating()

        // load movies
        let movieRequest = PopularMoviesRequest(
            primaryReleaseYear: "2020",
            sortBy: "vote_average.desc"
        )
        movieService.getPopularMovies(
            request: movieRequest,
            onSuccess: {
                (response) in

                self.activityIndicator.stopAnimating()
                self.movies = response.results
                self.tableView.reloadData()
            }, onFailure: {
                (errorMessage) in

                self.activityIndicator.stopAnimating()
                showAlert(title: "Failed", message: errorMessage, on: self)
            }
        )
    }
}

extension HomeVC {
    enum SectionTypes: CaseIterable {
        case popularMovies

        var title: String {
            switch self {
            case .popularMovies:
                return "Popular Movies"
            }
        }
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionTypes.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SectionTypes.allCases[section]
        switch sectionType {
        case .popularMovies:
            return movies.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MovieCell.self, for: indexPath)
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = SectionTypes.allCases[section]
        switch sectionType {
        case .popularMovies:
            let view = tableView.dequeueReusableHeaderFooterView(HomeSceneTableHeaderView.self)
            view.setTitle(sectionType.title)
            return view
        }
    }
}
