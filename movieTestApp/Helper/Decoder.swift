//
//  Decoder.swift
//  movieTestApp
//
//  Created by Goonja on 12/12/23.
//

import Foundation
final class Decoder<T: Decodable> {
    func decode(from data: Data) -> (Result<T, Error>) {
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            return .success(json)
        } catch {
            return .failure(error)
        }
    }
}
