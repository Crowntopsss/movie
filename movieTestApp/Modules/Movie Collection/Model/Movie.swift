//
//  Movie.swift
//  movieTestApp
//
//  Created by Temitope on 11/12/2023.
//

import Foundation

struct Movie: Codable {
    let id, voteCount: Int?
    let backdropPath, releaseDate: String?
    let originalTitle, overview: String?
    let popularity, voteAverage: Double?
    let posterPath, title: String?
    let adult: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case popularity
        case title
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case adult
    }
}

extension Movie {
    static func mockMovie() -> Movie {
        let movie = Movie(id: 1111, voteCount: 10, backdropPath: "yrhrhh.jpj", releaseDate: "20-11-20", originalTitle: "My Movie", overview: "", popularity: 10.0, voteAverage: 2.2, posterPath: "rututuu.hjgj", title: "My Movie", adult: false)
        return movie
    }
}
