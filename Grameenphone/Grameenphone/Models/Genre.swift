//
//  MovieGenre.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

class Genre: Codable {
    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
