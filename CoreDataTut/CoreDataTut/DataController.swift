//
//  DataController.swift
//  CoreDataTut
//
//  Created by Lucas Pereira on 03/05/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm") // Entity to access the CoreData
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
