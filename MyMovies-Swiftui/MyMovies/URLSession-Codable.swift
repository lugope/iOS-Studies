//
//  URLSession-Codable.swift
//  MyMovies
//
//  Created by Lucas on 09/07/21.
//

import Foundation
import Combine

extension URLSession {
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (T) -> Void) -> AnyCancellable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return self.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: RunLoop.main) //Push this work back to the main queue so it not running on a backgroud thread
            .sink(receiveValue: completion)
    }
}
