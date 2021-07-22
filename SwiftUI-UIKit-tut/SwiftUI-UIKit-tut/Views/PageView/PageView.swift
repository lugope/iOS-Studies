//
//  PageView.swift
//  SwiftUI-UIKit-tut
//
//  Created by Lucas on 20/07/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(
            pages: ModelData().features.map {
                FeatureCard(landmark: $0)
            }
        )
        .aspectRatio(contentMode: .fit)
    }
}
