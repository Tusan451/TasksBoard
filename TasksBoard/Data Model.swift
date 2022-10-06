//
//  Data Model.swift
//  TasksBoard
//
//  Created by Olegio on 04.10.2022.
//

import RealmSwift

// Data model

class Task: Object {
    @Persisted var name: String
    @Persisted var taskCategory: TaskCategory
    @Persisted var taskPriority: TaskPriority
}

class Project: Object {
    @Persisted var name: String
    @Persisted var tasks: List<Task>
}

enum TaskCategory: String, PersistableEnum {
    case new = "New"
    case inProgress = "In Progress"
    case review = "Under Review"
    case done = "Done"
}

enum TaskPriority: String, PersistableEnum {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}
