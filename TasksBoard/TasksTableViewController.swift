//
//  TasksTableViewController.swift
//  TasksBoard
//
//  Created by Olegio on 02.10.2022.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    private let cellID = "TaskCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        // Table view cell registry
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorStyle = .none
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
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc private func addTask() {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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
