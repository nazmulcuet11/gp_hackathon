//
//  FavouriteItemsProvider.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

class FavouriteItemsSotre {

    private let movieListKey = "FAVOURITE_MOVIE_LIST"
    private let tvSeriesListKey = "FAVOURITE_TV_SERIES"
    private let userDefaults = UserDefaults.standard

    private(set) var movies = [Movie]()
    private(set) var tvSerieses = [TVSeries]()

    init() {
        load()
    }

    deinit {
        save()
    }

    func addMovie(_ movie: Movie) {
        if !isFavouriteMovie(movie) {
            movies.append(movie)
        }
        save()
    }

    func isFavouriteMovie(_ movie: Movie) -> Bool {
        return movieIndex(movie) != nil
    }

    func removeMovie(_ movie: Movie) {
        if let index = movieIndex(movie)  {
            movies.remove(at: index)
            save()
        }
    }

    func addTVSeries(_ tvSeries: TVSeries) {
        if !isFavouriteTVSeries(tvSeries) {
            tvSerieses.append(tvSeries)
        }
        save()
    }

    func isFavouriteTVSeries(_ tvSeries: TVSeries) -> Bool {
        return tvSeriesIndex(tvSeries) != nil
    }

    func removeTVSeries(_ tvSeries: TVSeries) {
        if let index = tvSeriesIndex(tvSeries) {
            tvSerieses.remove(at: index)
            save()
        }
    }

    // MARK: - Helpers

    private func movieIndex(_ movie: Movie) -> Int? {
        return movies.firstIndex(where: { $0.id == movie.id })
    }

    private func tvSeriesIndex(_ tvSeries: TVSeries) -> Int? {
        return tvSerieses.firstIndex(where: { $0.id == tvSeries.id })
    }

    private func save() {
        if let data = try? JSONEncoder().encode(movies.self),
           let jsonStr = String(data: data, encoding: .utf8) {
            userDefaults.setValue(jsonStr, forKey: movieListKey)
        }

        if let data = try? JSONEncoder().encode(tvSerieses.self),
           let jsonStr = String(data: data, encoding: .utf8) {
            userDefaults.setValue(jsonStr, forKey: tvSeriesListKey)
        }
    }

    private func load() {
        if let str = userDefaults.string(forKey: movieListKey),
           let data = str.data(using: .utf8),
           let movieList = try? JSONDecoder().decode([Movie].self, from: data) {

            self.movies = movieList
        }

        if let str = userDefaults.string(forKey: tvSeriesListKey),
           let data = str.data(using: .utf8),
           let tvSeriesList = try? JSONDecoder().decode([TVSeries].self, from: data) {

            self.tvSerieses = tvSeriesList
        }
    }
}
