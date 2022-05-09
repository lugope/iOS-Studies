//
//  CloudKitTutView.swift
//  CloudKitTut
//
//  Created by Lucas Pereira on 05/05/22.
//

import SwiftUI

class CloudKitTutViewModel: ObservableObject {
    
}

struct CloudKitTutView: View {
    
    @StateObject private var vm = CloudKitTutViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct CloudKitTutView_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitTutView()
    }
}
