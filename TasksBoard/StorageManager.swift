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
    
    // Delete Project
    static func deleteProject(_ project: Project) {
        try! realm.write {
            let tasks = project.tasks
            realm.delete(tasks)
            realm.delete(project)
        }
    }
    
    // Save new Task in Project
    static func saveTask(in project: Project, task: Task) {
        try! realm.write {
            project.tasks.append(task)
        }
    }
    
    // Edit Task Category
    static func editTaskCategory(_ task: Task, newValue: TaskCategory) {
        try! realm.write {
            task.taskCategory = newValue
        }
    }
    
    // Edit Task Name
    static func editTaskName(_ task: Task, newValue: String) {
        try! realm.write {
            task.name = newValue
        }
    }
}
