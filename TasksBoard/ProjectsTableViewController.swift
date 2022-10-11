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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProjectTableViewCell

        let project = projects[indexPath.row]
        
        cell.detailButton.tag = indexPath.row
        cell.detailButton.addTarget(self, action: #selector(self.detailedViewAction), for: .touchUpInside)
        cell.infoLabel.text = "\(project.tasks.count) tasks"
        cell.projectTextLabel.text = project.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "DetailedView" else { return }
//        if let indexPath = tableView.indexPathForSelectedRow {
//            let project = projects[indexPath.row]
//            let tasksVC = segue.destination as! TasksTableViewController
//            tasksVC.currentProject = project
//        }
//    }
}

extension ProjectsTableViewController {
    
    // Alert for add and update project
    private func alertForAddAndUpdateProject() {
        let alert = UIAlertController(title: "New Project", message: "Enter project name", preferredStyle: .alert)
        var alertTextField: UITextField!
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newProjectName = alertTextField.text, !newProjectName.isEmpty else { return }
            
            let project = Project()
            project.name = newProjectName
            
            StorageManager.saveProject(project)
            self.tableView.insertRows(at: [IndexPath(row: self.projects.count - 1, section: 0)], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            alertTextField = textField
            alertTextField.placeholder = "Project Name"
        }
        present(alert, animated: true)
    }
}
