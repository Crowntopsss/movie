
import Foundation

protocol MovieService {
    func getPopularMovie(page: Int, completion: @escaping (Result<PopularMovieResponse, Error>) -> Void)
}
