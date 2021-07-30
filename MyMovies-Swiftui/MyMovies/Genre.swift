//
//  Genre.swift
//  MyMovies
//
//  Created by Lucas on 18/06/21.
//

import Foundation

struct Genre: Decodable, Identifiable {
    var id: String { name }
    let name: String
    let color: String
    
    //Recieve the json and transform in a tupla wich the key is the integer form of the number that is a string in the json
    static let all = Dictionary(uniqueKeysWithValues: Bundle.main.decode([String: Genre].self, from: "genres.json")
        .map{(Int($0) ?? 0, $1)})
}


