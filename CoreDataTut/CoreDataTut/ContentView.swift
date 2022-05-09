//
//  ContentView.swift
//  CoreDataTut
//
//  Created by Lucas Pereira on 03/05/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstNames = ["Josh", "Peter", "Lara"]
                let lastNames = ["Wormwood", "Godwill", "Jackson"]
                
                let choosenFirstName = firstNames.randomElement()!
                let choosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(choosenFirstName) \(choosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
