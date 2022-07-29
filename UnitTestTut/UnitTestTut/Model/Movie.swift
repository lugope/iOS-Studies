//
//  Movie.swift
//  UnitTestTut
//
//  Created by Lucas Pereira on 29/07/22.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
