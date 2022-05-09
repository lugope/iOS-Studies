//
//  CloudKitTutView.swift
//  CloudKitTut
//
//  Created by Lucas Pereira on 05/05/22.
//

import SwiftUI
import CloudKit

class CloudKitTutViewModel: ObservableObject {
    @Published var permissionStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    
    init() {
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    
    private func getiCloudStatus() {
        // Check if the user is actually signed in his iCloud account
        // As this will happen in a background thread with async code we add [weak self]
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                switch returnedStatus {
                case .available:
                    self?.isSignedInToiCloud = true
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountNotRestricted.rawValue
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                case .temporarilyUnavailable:
                    self?.error = CloudKitError.iCloudAccountNotTemporarilyUnavailable.rawValue
                @unknown default:
                    self?.error = CloudKitError.iCloudAccountNotUnknown.rawValue
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountNotRestricted
        case iCloudAccountNotTemporarilyUnavailable
        case iCloudAccountNotUnknown
    }
    
    // Access iCloud user information
    func fetchiCloudUserRecordID() {
        CKContainer.default().fetchUserRecordID { returnedID, returnedError in
            if let id = returnedID {
                self.discoveriCloudUser(id: id)
            }
        }
    }
    
    func requestPermission() {
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.permissionStatus = true
                }
            }
        }
    }
    
    func discoveriCloudUser(id: CKRecord.ID) {
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName {
                    self?.userName = name
                }
            }
        }
    }
}

struct CloudKitTutView: View {
    
    @StateObject private var vm = CloudKitTutViewModel()
    
    var body: some View {
        VStack {
            Text("IS SIGNED IN: \(vm.isSignedInToiCloud.description.uppercased())")
                .padding()
            Text(vm.error).foregroundColor(Color.red)
            Text("Permission: \(vm.permissionStatus.description.uppercased())")
            Text("Name: \(vm.userName)")
        }
    }
}

struct CloudKitTutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CloudKitTutView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .previewDisplayName("iPhone 12")
        }
    }
}
