//
//  Requestable.swift
//  movieTestApp
//
//  Created by Temitope on 12/12/2023.
//

import Foundation

enum RequestType: String {
    case get = "GET"
}

protocol Requestable {
    func makeRequest<T: Decodable> (
        requestType: RequestType,
        url: String, params: [String: Any]?,
        completionHandler: @escaping (Result<T, Error>) -> Void
    )
}
