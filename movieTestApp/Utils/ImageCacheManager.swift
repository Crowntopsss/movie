//
//  ImageCacheManager.swift
//  movieTestApp
//
//  Created by Goonja on 12/12/23.
//

import Foundation
import UIKit

final class ImageCacheManager {
    static let cache = NSCache<NSString, NSData>()

    static func fetchImageData(from url: String, completion: @escaping (NSData) -> (Void)){
        let key = NSString(string: url)
        
        let DBManager = DBManager(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        let image = DBManager.getAllItems(entity: ImageData.self)?.filter({$0.urlPath == url}).first
        
        
        if let cachedImage = image?.imageData {
            DispatchQueue.global(qos: .background).async {
                completion(cachedImage as NSData)
            }
        } else {
            DispatchQueue.global(qos: .background).async {
                guard let apiUrl = URL(string: url) else {return}
                guard let idata = try? Data(contentsOf: apiUrl) else {return}
                let ns = NSData(data: idata)
                let newImage = DBManager.createItem(entity: ImageData.self)
                newImage?.imageData = idata
                newImage?.urlPath = url
                DBManager.save()
                cache.setObject(ns, forKey: key)
                completion(ns)
            }
        }
    }
    
}

