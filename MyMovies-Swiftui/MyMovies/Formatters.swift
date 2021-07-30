//
//  Formatters.swift
//  MyMovies
//
//  Created by Lucas on 12/05/21.
//

import Foundation

enum Formatters {
    static let movieDecoding: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "y-m-d"
        return formatter
    }()
    
    static let movieDisplay: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter
    }()
}
