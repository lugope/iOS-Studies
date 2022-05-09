//
//  CoreDataTutApp.swift
//  CoreDataTut
//
//  Created by Lucas Pereira on 03/05/22.
//

import SwiftUI

@main
struct CoreDataTutApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) // This inject the data to the environment
                //managedObjectContext is the live version of your data
        }
    }
}
