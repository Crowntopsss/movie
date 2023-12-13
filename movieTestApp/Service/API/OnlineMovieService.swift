//
//  OnlineMovieService.swift
//  movieTestApp
//
//  Created by Temitope on 08/12/2023.
//

import Foundation

final class OnlineMovieService: MovieService {
    private let networkManager: Requestable
    
    init(requestable: Requestable) {
        self.networkManager = requestable
    }
    
    func getPopularMovie(page: Int, completion: @escaping (Result<PopularMovieResponse, Error>) -> Void) {
        networkManager.makeRequest(
            requestType: .get,
            url: URLConstants.baseURL.rawValue + URLConstants.popular.rawValue , params: [
                URLConstants.apiKeyString.rawValue: URLConstants.apiKeyValue.rawValue,
                "page": page],
            completionHandler: completion
        )
    }
}
