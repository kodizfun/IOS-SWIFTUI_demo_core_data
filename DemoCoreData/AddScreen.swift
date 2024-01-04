//
//  AddScreen.swift
//  DemoCoreData
//
//  Created by Sengsathit SILALAK on 19/12/2023.
//

import SwiftUI

struct AddScreen: View {
    
    @Environment(\.dismiss) var quitScreen
    @Environment(\.managedObjectContext) var moc
    
    @State var studentName = ""
    
    var body: some View {
        VStack {
            TextField(text: $studentName, label: {
                Text("Nom")
            })
            Button("Ajouter") {
                let newStudent = Student(context: moc)
                newStudent.id = UUID()
                newStudent.name = studentName

                do {
                    try moc.save()
                    quitScreen()
                } catch {
                    print("Error")
                }
            }
        }.padding()
    }
}
