//
//  MovieManager.swift
//  UnitTestTut
//
//  Created by Lucas Pereira on 29/07/22.
//

import Foundation

class MovieManager {
    var moviesToSee = 0
    var moviesSeenCount = 0
    
    private var moviesToSeeArray: [Movie] = []
    
    func addMovie(movie: Movie) {
        moviesToSee += 1
        moviesToSeeArray.append(movie)
    }
    
    func returnMovieAtIndex(index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
}
