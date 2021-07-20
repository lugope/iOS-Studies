//
//  SwiftUI_UIKit_tutApp.swift
//  SwiftUI-UIKit-tut
//
//  Created by Lucas on 20/07/21.
//

import SwiftUI

@main
struct SwiftUI_UIKit_tutApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
