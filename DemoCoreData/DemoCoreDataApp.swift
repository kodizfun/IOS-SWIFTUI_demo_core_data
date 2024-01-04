//
//  DemoCoreDataApp.swift
//  DemoCoreData
//
//  Created by Sengsathit SILALAK on 19/12/2023.
//

import SwiftUI

@main
struct DemoCoreDataApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
