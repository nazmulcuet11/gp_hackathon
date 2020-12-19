//
//  MovieLanguage.swift
//  Grameenphone
//
//  Created by Nazmul Islam on 19/12/20.
//

import Foundation

enum Language: String, Codable {
    case de = "de"
    case en = "en"
    case pt = "pt"
    case ja = "ja"

    var description: String {
        switch self {
        case .de:
            return "German"
        case .en:
            return "English"
        case .pt:
            return "Portuguese"
        case .ja:
            return "Japanese"
        }
    }
}
