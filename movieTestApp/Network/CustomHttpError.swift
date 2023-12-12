//
//  CustomHttpError.swift
//  movieTestApp
//
//  Created by Temitope on 12/12/2023.
//

import Foundation

enum CustomHttpError: Error {
    case badRequest
    case serverError
    case unknown
    case sessionNotAvailable
    case noDataReturned
    case badUrl
    case badHeader
}


