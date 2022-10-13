//
//  ProjectsTableViewController.swift
//  TasksBoard
//
//  Created by Olegio on 29.09.2022.
//

import UIKit
import RealmSwift

class ProjectsTableViewController: UITableViewController {
    
    public var projects: Results<Project>!
    var projectToSend: Project?
    
    private let cellID = "cell"
    
    private var detailedViewSegue: UIStoryboardSegue!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Table view cell registry
        tableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Init objects from Realm
        projects = realm.objects(Project.self)
        tableView.reloadData()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "My Projects"
        
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
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProject))
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // Add new project to Realm and at the tableView
    @objc private func addProject() {
        alertForAddAndUpdateProject()
    }
    
    @objc private func detailedViewAction(sender: UIButton) {
        let buttonRow = sender.tag
        projectToSend = projects[buttonRow]
        let tasksVC = TasksTableViewController(currentProject: projectToSend)
        detailedViewSegue = UIStoryboardSegue(identifier: "DetailedView", source: ProjectsTableViewController(), destination: tasksVC, performHandler: {
            self.show(self.detailedViewSegue.destination, sender: UIButton.self)
        })
        detailedViewSegue.perform()
    }
    
    @objc private func editButtonAction(sender: UIButton) {
        let buttonRow = sender.tag
        let project = projects[buttonRow]
        alertForAddAndUpdateProject(project) {
            self.tableView.reloadRows(at: [IndexPath(row: buttonRow, section: 0)], with: .automatic)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProjectTableViewCell

        let project = projects[indexPath.row]
        
        cell.detailButton.tag = indexPath.row
        cell.editButton.tag = indexPath.row
        cell.editButton.addTarget(self, action: #selector(self.editButtonAction), for: .touchUpInside)
        cell.detailButton.addTarget(self, action: #selector(self.detailedViewAction), for: .touchUpInside)
        cell.infoLabel.text = "\(project.tasks.count) tasks"
        cell.projectTextLabel.text = project.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    // MARK: - Table view Delegate
    
    // Delete Project from the data and tableView
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        let project = projects[indexPath.row]
        
        StorageManager.deleteProject(project)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadRows(at: [indexPath], with: .none)

    }
}

extension ProjectsTableViewController {
    
    // Alert for add and update project
    private func alertForAddAndUpdateProject(_ project: Project? = nil, complition: (() -> Void)? = nil) {
        
        var title = "New Project"
        var doneButton = "Save"
        
        if project != nil {
            title = "Edit Project"
            doneButton = "Update"
        }
        
        let alert = UIAlertController(title: title, message: "Enter project name", preferredStyle: .alert)
        var alertTextField: UITextField!
        
        let saveAction = UIAlertAction(title: doneButton, style: .default) { _ in
            guard let newProjectName = alertTextField.text, !newProjectName.isEmpty else { return }
            
            if let project = project {
                StorageManager.editProject(project, newValue: newProjectName)
                if complition != nil { complition!() }
            } else {
                let project = Project()
                project.name = newProjectName
                
                StorageManager.saveProject(project)
                self.tableView.insertRows(at: [IndexPath(row: self.projects.count - 1, section: 0)], with: .automatic)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            alertTextField = textField
            alertTextField.placeholder = "Project Name"
        }
        
        if let project = project {
            alertTextField.text = project.name
        }
        
        present(alert, animated: true)
    }
}
