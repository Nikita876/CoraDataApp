//
//  CoreDataManager.swift
//  CoraDataApp
//
//  Created by Никита Коголенок on 22.02.21.
//

import Foundation
import CoreData

class CoreDataManager {
    // MARK: - Static properties
    static let entityName: String = "CarModel"
    static let shared = CoreDataManager()
    // MARK: - CoreData
    private var persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataManager.entityName)
        container.loadPersistentStores(completionHandler: { (description, error) in
            print("Store: \(description)")
            if let error = error {
                fatalError("Unable to load persistent store: \(error)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext{
        self.persistantContainer.viewContext
    }
    
    // MARK: - Initialization
    private init() { }
    // MARK: - Methods
    //метод сохранения данных в базу данных
    func writeToDB(name: String) {
        if let entity = NSEntityDescription.entity(forEntityName: name, in: self.context) {
            let carObject = NSManagedObject(entity: entity, insertInto: self.context)
            carObject.setValue(2, forKey: "id")
            carObject.setValue("Skoda", forKey: "name")
            carObject.setValue("Superd", forKey: "model")
            carObject.setValue("white", forKey: "color")
        }
        
        do {
            try self.context.save()
        } catch let error as NSError {
            print("Couldn't save data. \(error), \(error.userInfo)")
        }
    }
    //метод чтения из базы данный
    func readFromDB(from name: String) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: name)
        
        do {
            let result = try context.fetch(fetchRequest)
            result.forEach {
                print($0.value(forKey: "id") ?? "id error")
                print($0.value(forKey: "name") ?? "name error")
                print($0.value(forKey: "model") ?? "model error")
                print($0.value(forKey: "color") ?? "color error")
            }
        } catch let error as NSError {
            print("Couldn't save data. \(error), \(error.userInfo)")
        }
    }
    //метод удаления из базы данных
    func removeFromDB(from name: String, with id: Int) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: name)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(fetchRequest)
            result.forEach {
                if let carId = $0.value(forKey: "id") as? Int, carId == id {
                    self.context.delete($0)
                }
            }
        } catch let error as NSError {
            print("Couldn't save data. \(error), \(error.userInfo)")
        }
    }
    //метод удаления всей базы данных
    func removeAllFromDB(from name: String) {
        let fetchRquest = NSFetchRequest<NSManagedObject>(entityName: name)
        fetchRquest.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(fetchRquest)
            result.forEach { self.context.delete($0) }
        } catch let error as NSError {
            print("Couldn't save data. \(error), \(error.userInfo)")
        }
    }
}
