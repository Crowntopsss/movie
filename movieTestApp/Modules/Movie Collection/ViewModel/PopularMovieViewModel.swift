//
//  PopularMovieViewModel.swift
//  movieTestApp
//
//  Created by Temitope on 11/12/2023.
//

import Foundation

final class PopularMovieViewModel {
    let service: MovieService
    var movies: [Movie] = []
    var state: ((State) -> Void)?
    var page = 1
    
    init(service: MovieService) {
        self.service = service
    }
    
    func getMovies() {
        service.getPopularMovie(page: page) {[weak self] response in
            switch response {
            case .success(let data):
                self?.movies.append(contentsOf: data.results ?? [])
                self?.state?(.success)
            case .failure(let error):
                self?.state?(.error(error: error))
            }
        }
    }
}

extension PopularMovieViewModel {
    enum State: Equatable {
        case success
        case error(error: Error?)
        
        static func == (lhs: PopularMovieViewModel.State, rhs: PopularMovieViewModel.State) -> Bool {
            switch (lhs, rhs) {
            case (.success, .success):
                return true
            case (.error, .error):
                return true
            default:
            return false
            }
        }
    }
}
