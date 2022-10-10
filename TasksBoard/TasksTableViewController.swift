//
//  TasksTableViewController.swift
//  TasksBoard
//
//  Created by Olegio on 02.10.2022.
//

import UIKit
import RealmSwift

class TasksTableViewController: UITableViewController {
    
    // Recieved object from ProjectsTableViewController
    private let currentProject: Project!
    
    // Collections for filter tasks in interface
    var newTasks: List<Task> = List()
    var inProgressTasks: List<Task> = List()
    var reviewTasks: List<Task> = List()
    var doneTasks: List<Task> = List()
    
    private let cellID = "TaskCell"
    
    private var addTaskSegue: UIStoryboardSegue!
    
    init(currentProject: Project?) {
        self.currentProject = currentProject
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        // Table view cell registry
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
        
        // Filtering tasks by category
        filteringTasks()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = currentProject?.name
        
        // Set navigation bar basic settings
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.backgroundColor = UIColor(red: 120/255, green: 110/255, blue: 232/255, alpha: 1)
        appearence.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearence
        navigationItem.scrollEdgeAppearance = appearence
        navigationItem.compactAppearance = appearence
        
        // Set navigation bar large title
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        // Set add button to navigation bar
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc private func addTask() {
        addTaskSegue = UIStoryboardSegue(identifier: "addTask", source: TasksTableViewController(currentProject: nil), destination: NewTaskViewController(), performHandler: {
            self.show(NewTaskViewController(), sender: nil)
        })
        addTaskSegue.perform()
    }
    
    private func filteringTasks() {
        
        for task in currentProject.tasks {
            switch task.taskCategory {
            case .new: newTasks.append(task)
            case .inProgress: inProgressTasks.append(task)
            case .review: reviewTasks.append(task)
            case .done: doneTasks.append(task)
            }
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            if newTasks.count != 0 { return newTasks.count } else { return 0 }
        case 1:
            if inProgressTasks.count != 0 { return inProgressTasks.count } else { return 0 }
        case 2:
            if reviewTasks.count != 0 { return reviewTasks.count } else { return 0 }
        case 3:
            if doneTasks.count != 0 { return doneTasks.count } else { return 0 }
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "New"
        case 1: return "In Progress"
        case 2: return "Under Review"
        case 3: return "Done"
        default: return ""
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TaskTableViewCell

        var task: Task!
        
        switch indexPath.section {
        case 0: task = newTasks[indexPath.row]
        case 1: task = inProgressTasks[indexPath.row]
        case 2: task = reviewTasks[indexPath.row]
        case 3: task = doneTasks[indexPath.row]
        default: break
        }
        
        cell.configureTheCell(for: task)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigationController?.pushViewController(CurrentTaskViewController(), animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
