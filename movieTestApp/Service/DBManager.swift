
import Foundation
import UIKit
import CoreData

protocol DBActions {
    func getAllItems<T: NSManagedObject> (entity: T.Type) -> [T]?
    func createItem<T: NSManagedObject> (entity: T.Type) -> T?
    func save()
    func deleteItem<T: NSManagedObject> (entity: T.Type)
    func deleteALL<T: NSManagedObject> (entity: T.Type)
}

class DBManager: DBActions {
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func getAllItems<T: NSManagedObject> (entity: T.Type) -> [T]? {
        do {
            return try context.fetch((T.fetchRequest() as! NSFetchRequest<T>))
        } catch  {
            print("fetch error")
        }
        return nil
    }
    
    func createItem<T: NSManagedObject> (entity: T.Type) -> T? {
        let taskItem = T(context: context)
        return taskItem
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("An error ocurred while saving: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteItem<T: NSManagedObject> (entity: T.Type) {
        context.delete(T(context: context))
        do {
            try context.save()
        } catch  {
            print("fetch error")
        }
    }
    
    func deleteALL<T: NSManagedObject> (entity: T.Type) {
        let datas = getAllItems(entity: entity) ?? []
        for managedObject in datas {
            let managedObjectData: NSManagedObject = managedObject as NSManagedObject
            context.delete(managedObjectData)
            do {
                try context.save()
            } catch  {
                print("fetch error")
            }
        }
    }
    
}
