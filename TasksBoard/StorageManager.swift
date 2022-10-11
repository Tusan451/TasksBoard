//
//  StorageManager.swift
//  TasksBoard
//
//  Created by Olegio on 07.10.2022.
//

import RealmSwift

// Open the local-only default realm
let realm = try! Realm()

// Class for working with Realm
class StorageManager {
    
    // Save Project to Realm
    static func saveProject(_ project: Project) {
        try! realm.write {
            realm.add(project)
        }
    }
    
    // Edit Project name
    static func editProject(_ project: Project, newValue: String) {
        try! realm.write {
            project.name = newValue
        }
    }
}
