//
//  SwiftUI_UIKit_tutApp.swift
//  SwiftUI-UIKit-tut
//
//  Created by Lucas on 20/07/21.
//

import SwiftUI

@main
struct SwiftUI_UIKit_tutApp: App {

    var body: some Scene {
        WindowGroup {
            PageView(pages: ModelData().features.map {
                FeatureCard(landmark: $0)
            })
        }
    }
}
