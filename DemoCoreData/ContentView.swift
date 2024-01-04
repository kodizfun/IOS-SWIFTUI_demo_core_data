//
//  ContentView.swift
//  DemoCoreData
//
//  Created by Sengsathit SILALAK on 19/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @Environment(\.managedObjectContext) var moc
    
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(students, id: \.self) { student in
                        Text(student.name ?? "Unknown")
                    }
                    .onDelete(perform: deleteStudent)
                }
            }
            .navigationTitle("Étudiants")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Ajouter un étudiant") {
                        showAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showAddScreen) {
                AddScreen()
            }
        }
    }
    
    func deleteStudent(offsets: IndexSet) {
        offsets.forEach { index in
            let student = students[index]
            moc.delete(student)
        }
        
        do {
            try moc.save()
        } catch {
            print("Erreur")
        }
    }
}
