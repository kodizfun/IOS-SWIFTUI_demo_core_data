//
//  DataController.swift
//  DemoCoreData
//
//  Created by Sengsathit SILALAK on 19/12/2023.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "LocalData")
    
    init() {
        container.loadPersistentStores { description, error in
            print("Description : ", description)
        }
    }
}
