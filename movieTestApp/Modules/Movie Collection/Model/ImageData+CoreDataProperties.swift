//
//  ImageData+CoreDataProperties.swift
//  movieTestApp
//
//  Created by Temitope on 10/12/2023.
//
//

import Foundation
import CoreData


extension ImageData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageData> {
        return NSFetchRequest<ImageData>(entityName: "ImageData")
    }

    @NSManaged public var imageData: Data?
    @NSManaged public var urlPath: String?

}

extension ImageData : Identifiable {

}
