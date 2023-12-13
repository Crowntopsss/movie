//
//  StringConstants.swift
//  movieTestApp
//
//  Created by Goonja on 12/12/23.
//

import Foundation
enum StringConstants: String {
    case error  = "Error"
    case postGenericError = "An error occured while trying to get movie"
    case cancel =  "Cancel"
    case tryAgain = "Try Again"
    case popularMovies = "Popular Movies"
    case loading = "Loading Content ...."
    case continueText = "Press continue to see more details about"
    case continueLabel = "Continue"
}

extension StringConstants {
    var text: String {
        self.rawValue
    }
}
