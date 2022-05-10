//
//  CloudKitCRUDView.swift
//  CloudKitTut
//
//  Created by Lucas Pereira on 09/05/22.
//

import SwiftUI
import CloudKit

struct FruitModel: Hashable {
    let name: String
    let record: CKRecord
}

class CloudKitCRUDViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var fruits: [FruitModel] = []
    
    init() {
        fetchItems()
    }
    
    func abbButtonPressed() {
        guard !text.isEmpty else { return }
        addItem(name: text)
    }
    
    private func addItem(name: String) {
        let newFruit = CKRecord(recordType: "Fruits")
        newFruit["name"] = name
        
        saveItem(record: newFruit)
    }
    
    private func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print("Record: \(returnedError.debugDescription)")
            print("Error: \(returnedError.debugDescription)")
            
            DispatchQueue.main.async {
                self?.text = ""
                self?.fetchItems()
            }
        }
    }
    
    func fetchItems() {
        let predicate = NSPredicate(value: true) //Definition of logical conditions for constraining a search. In this case all the "Fruits" that exist
//        let predicate = NSPredicate(format: "name = %@", argumentArray: ["Coconut"]) //Another example. Predicate uses the same querry definitions as Core Data
        let query = CKQuery(recordType: "Fruits", predicate: predicate) //Definition of the query
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)] //Describing how the data should be sorted
        let queryOperation = CKQueryOperation(query: query)
        
        var returnedItems: [FruitModel] = []
        
        // Is called avery time we hit a record in our database
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult {
            case .success(let record):
                guard let name = record["name"] as? String else { return }
                returnedItems.append(FruitModel(name: name, record: record))
                
            case .failure(let error):
                print("Error recordedMatchedBlock: \(error)")
            }
        }
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("RETURNED RESULT: \(returnedResult)")
            DispatchQueue.main.async {
                self?.fruits = returnedItems
            }
        }
        
        // Run the operation
        CKContainer.default().publicCloudDatabase.add(queryOperation)
    }
    
    func updateItem(fruit: FruitModel) {
        let record = fruit.record
        record["name"] = "NEW NAME!!!"
        saveItem(record: record)
    }
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = fruits[index]
        let record = fruit.record
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordID, returnedError in
            DispatchQueue.main.async {
                self?.fruits.remove(at: index)
            }
        }
    }
}

struct CloudKitCRUDView: View {
    @StateObject private var vm = CloudKitCRUDViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                header
                textField
                addButton
                
                List {
                    ForEach(vm.fruits, id: \.self) { fruit in
                        Text(fruit.name)
                            .onTapGesture {
                                vm.updateItem(fruit: fruit)
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

extension CloudKitCRUDView {
    private var header: some View {
        Text("CloudKit CRUD ☁️")
            .font(.headline)
    }
    
    private var textField: some View {
        TextField("Add something here...", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var addButton: some View {
        Button {
            vm.abbButtonPressed()
        } label: {
            Text("Add")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct CloudKitCRUDView_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitCRUDView()
    }
}
