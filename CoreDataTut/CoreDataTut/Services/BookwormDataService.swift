//
//  BookwormDataService.swift
//  CoreDataTut
//
//  Created by Lucas Pereira on 13/05/22.
//

import Foundation
import CoreData

class BookwormDataService {
    private let container: NSPersistentContainer
    private let containerName: String = "Bookworm"
    private let entityName: String = "Course"
    
    @Published var courseEntities: [Course] = []
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
