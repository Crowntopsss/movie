
import Foundation

final class MovieRepository: MovieService {
    let offlineMoiveService: OfflineStore
    let onlinMovieService: MovieService
    
    init(
        offlineMoiveService: OfflineStore,
        onlineMovieService: MovieService
    ) {
        self.onlinMovieService = onlineMovieService
        self.offlineMoiveService = offlineMoiveService
    }
    
    func getPopularMovie(page: Int, completion: @escaping (Result<PopularMovieResponse, Error>) -> Void) {
        onlinMovieService.getPopularMovie(page: page) { [weak self] result in
            switch result {
            case .success(let data):
                self?.offlineMoiveService.save(movies: data.results ?? [])
                completion(.success(data))
            case .failure(let error):
                self?.offlineMoiveService.getPopularMovie(page: page) { result in
                    switch result {
                    case .success(let data):
                        if ((data.results?.isEmpty) != nil) {
                            completion(.success(data))
                        } else {
                            completion(.failure(error))
                        }
                    case .failure:
                        completion(.failure(error))
                    }
                }
            }
        }
        onlinMovieService.getPopularMovie(page: page, completion: completion)
    }
}
