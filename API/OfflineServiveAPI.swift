
import Foundation

protocol OfflineStore: MovieService {
    func save(movies: [Movie])
}

final class OfflineMovieAPI: OfflineStore {
    
    let database: DBActions

    init(database: DBActions) {
        self.database = database
    }
    
    func getPopularMovie(page: Int, completion: @escaping (Result<PopularMovieResponse, Error>) -> Void) {
        var movies = PopularMovieResponse(results: [Movie]())
        guard let allMovies = database.getAllItems(entity: MovieEntity.self) else { return }
        movies.results = allMovies.map({$0.toArticleObj()})
        completion(.success(movies))
    }
    
    func save(movies: [Movie]) {
        guard let allMovies = database.getAllItems(entity: MovieEntity.self) else { return }
        for movie in movies {
            // avoiding duplicates
            if allMovies.count == 0 {
                
            } else if allMovies.contains(where: { MovieEntity in
                return MovieEntity.id == movie.id!
            }) {
                continue
            }
            let item = database.createItem(entity: MovieEntity.self)
            item?.id = Int64(movie.id ?? 0)
            item?.backdropPath = movie.backdropPath
            item?.originalTitle = movie.originalTitle
            item?.overview = movie.overview
            item?.popularity = movie.popularity ?? 0.0
            item?.voteAverage = movie.voteAverage ?? 0.0
            item?.posterPath = movie.posterPath
            item?.title = movie.title
            item?.releaseDate = movie.releaseDate
            item?.voteCount = Int64(movie.voteCount ?? 0)
            item?.adult = movie.adult ?? false
            database.save()
        }
    }
}
