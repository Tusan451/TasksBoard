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
    static func saveProject(_ projects: [Project]) {
        try! realm.write {
            realm.add(projects)
        }
    }
}
