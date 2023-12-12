//
//  MovieEntity+CoreDataProperties.swift
//  movieTestApp
//
//  Created by Temitope on 11/12/2023.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var backdropPath: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Double
    @NSManaged public var voteAverage: Double
    @NSManaged public var posterPath: String?
    @NSManaged public var title: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var voteCount: Int64
    @NSManaged public var adult: Bool

}

extension MovieEntity : Identifiable {
    func toArticleObj() -> Movie {
        Movie(id: Int(id),
              voteCount: Int(voteCount),
              backdropPath: backdropPath,
              releaseDate: releaseDate,
              originalTitle: originalTitle,
              overview: overview,
              popularity: popularity,
              voteAverage: voteAverage,
              posterPath: posterPath,
              title: title,
              adult: adult
            )
    }
}
