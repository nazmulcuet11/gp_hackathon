//
//  ViewController.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import UIKit

class HomeVC: UIViewController, StoryboardBased {

    // MARK: - Dependency

    var factory: ViewControllerFactory!
    var movieService: MovieService!
    var tvSeriesService: TVSeriesService!
    var trendinContentService: TrendingContentService!

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Private properties

    private var loadingMovies = false
    private var movies = [Movie]()

    private var loadingTVSeries = false
    private var tvSerieses = [TVSeries]()

    private var loadingTrendingContent = false
    private var trendingContents = [TrendingContent]()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = AppStrings.homePageTitle

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200.0

        tableView.registerNibCell(MoviesCollectionViewContainerCell.self)
        tableView.registerNibCell(TVSeriesCollectionViewContainerCell.self)
        tableView.registerNibCell(SinglLineButtonCell.self)
        tableView.registerNibCell(TrendingContentCell.self)

        tableView.registerNibHeaderFooter(HomeSceneTableHeaderView.self)

        tableView.separatorStyle = .none
        tableView.allowsSelection = false

        tableView.dataSource = self
        tableView.delegate = self

        loadData()
    }

    // MARK: - Helpers

    private func loadData() {

        activityIndicator.startAnimating()

        // load movies
        loadingMovies = true
        let movieRequest = PopularMoviesRequest(
            primaryReleaseYear: "2020",
            sortBy: "vote_average.desc"
        )
        movieService.getPopularMovies(
            request: movieRequest,
            onSuccess: {
                (response) in

                self.loadingMovies = false
                self.activityIndicator.stopAnimating()
                self.movies = response.results
                self.tableView.reloadData()
            }, onFailure: {
                (errorMessage) in

                self.loadingMovies = false
                self.activityIndicator.stopAnimating()
                showAlert(title: "Failed", message: errorMessage, on: self)
            }
        )

        // load tv series
        loadingTVSeries = true
        let tvSeriesRequest = PopularTVSeriesRequest(
            primaryReleaseYear: "2020",
            sortBy: "vote_average.desc"
        )
        tvSeriesService.getPopularTVSeries(
            request: tvSeriesRequest,
            onSuccess: {
                (response) in

                self.loadingTVSeries = false
                self.activityIndicator.stopAnimating()
                self.tvSerieses = response.results
                self.tableView.reloadData()
            }, onFailure: {
                (errorMessage) in

                self.loadingTVSeries = false
                self.activityIndicator.stopAnimating()
                showAlert(title: "Failed", message: errorMessage, on: self)
            }
        )

        // load trending contents
        loadingTrendingContent = true
        trendinContentService.getTrendingContents(
            onSuccess: {
                (response) in

                self.loadingTrendingContent = false
                self.activityIndicator.stopAnimating()
                self.trendingContents = response.results
                self.tableView.reloadData()
            }, onFailure: {
                (errorMessage) in

                self.loadingTrendingContent = false
                self.activityIndicator.stopAnimating()
                showAlert(title: "Failed", message: errorMessage, on: self)
            }
        )
    }

    func navigateToFavouriteItemVC() {
        let vc = factory.getFavouriteItemsVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC {
    enum SectionTypes: CaseIterable {
        case popularMovies
        case tvSeries
        case favouriteItems
        case trendingContent

        var title: String {
            switch self {
            case .popularMovies:
                return "Popular Movies"
            case .favouriteItems:
                return "View favourite items"
            case .tvSeries:
                return "Popular TV Series"
            case .trendingContent:
                return "Trending Contents"
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
            return 1
        case .tvSeries:
            return 1
        case .favouriteItems:
            return 1
        case .trendingContent:
            return trendingContents.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = SectionTypes.allCases[indexPath.section]
        switch sectionType {
        case .popularMovies:
            let cell = tableView.dequeueReusableCell(MoviesCollectionViewContainerCell.self, for: indexPath)
            cell.configure(with: movies, loading: loadingMovies, delegate: self)
            return cell
        case .tvSeries:
            let cell = tableView.dequeueReusableCell(TVSeriesCollectionViewContainerCell.self, for: indexPath)
            cell.configure(with: tvSerieses, loading: loadingTVSeries, delegate: self)
            return cell
        case .favouriteItems:
            let cell = tableView.dequeueReusableCell(SinglLineButtonCell.self, for: indexPath)
            cell.configure(title: SectionTypes.favouriteItems.title) {
                self.navigateToFavouriteItemVC()
            }
            return cell
        case .trendingContent:
            let cell = tableView.dequeueReusableCell(TrendingContentCell.self, for: indexPath)
            let trendingContent = trendingContents[indexPath.row]
            cell.configure(with: trendingContent)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = SectionTypes.allCases[section]
        switch sectionType {
        case .favouriteItems:
            return 1
        default:
            return 40
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionType = SectionTypes.allCases[section]
        switch sectionType {
        case .favouriteItems:
            return nil
        default:
            let view = tableView.dequeueReusableHeaderFooterView(HomeSceneTableHeaderView.self)
            view.setTitle(sectionType.title)
            return view
        }
    }
}

extension HomeVC: MovieSelectionDelegate {
    func didSelectMovie(_ movie: Movie) {
        let vc = factory.getMovieDetailVC(for: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: TVSeriesSelecetionDelegate {
    func didSelectTVSeries(_ tvSeries: TVSeries) {
        let vc = factory.getTVSeriesDetailVC(for: tvSeries)
        navigationController?.pushViewController(vc, animated: true)
    }
}
