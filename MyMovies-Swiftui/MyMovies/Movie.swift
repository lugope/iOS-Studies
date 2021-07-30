//
//  Movie.swift
//  MyMovies
//
//  Created by Nick Romano on 5/12/21.
//

import Foundation

struct SearchResults: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let posterPath: String?
    let backdropPath: String?
    let genreIds: Set<Int>
    
    var formatterReleaseDate: String {
        guard !releaseDate.isEmpty else {return ""}
        
        if let date = Formatters.movieDecoding.date(from: releaseDate) {
            return Formatters.movieDisplay.string(from: date)
        } else {
            return ""
        }
    }
    
    var genres: [Genre] {
        Genre.all.compactMap{ key, value in
            genreIds.contains(key) ? value : nil
        }.sorted{
            $0.name < $1.name
        }
    }
    
    // Example placeholder
    static let example = Movie(id: 0, title: "Batman", overview: "Rich man beats up poor street criminals.", releaseDate: "1989-01-01", voteAverage: 10, posterPath: "/tDexQyu6FWltcd0VhEDK7uib42f.jpg", backdropPath: "/2va32apQP97gvUxaMnL5wYt4CRB.jpg", genreIds: [12, 14, 16, 18, 27, 28])
}


