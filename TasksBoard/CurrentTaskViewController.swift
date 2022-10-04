//
//  CurrentTaskViewController.swift
//  TasksBoard
//
//  Created by Olegio on 04.10.2022.
//

import UIKit

class CurrentTaskViewController: UIViewController, UITextViewDelegate {
    
    let taskView = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 60))
    let textView = UITextView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 80))
    let statusLabel = UIButton(type: .system)
    let actionButton = UIButton(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 43))
    let revisionButton = UIButton(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 43))

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        setupNavigationBar()
        setupTaskView()
        setupStatusLabel()
        setupActionButtonn()
        setupRevisionButton()
    }
    
    private func setupNavigationBar() {
        title = "Current task"
        
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
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTask))
        rightBarButtonItem.tintColor = .white
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc private func deleteTask() {
        
    }
    
    // Set attributes to taskView
    private func setupTaskView() {
        taskView.translatesAutoresizingMaskIntoConstraints = false
        taskView.backgroundColor = .white
        taskView.layer.borderWidth = 1
        taskView.layer.borderColor = CGColor(red: 233/255, green: 236/255, blue: 238/255, alpha: 1)
        taskView.layer.cornerRadius = 12
        
        self.view.addSubview(taskView)
        
        taskView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        taskView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        taskView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        taskView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -400).isActive = true
        
        setupTextView()
    }
    
    // Set attributes to textView
    private func setupTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = nil
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.text = "Task text"
        textView.textColor = .black
        textView.autocorrectionType = .no
        textView.delegate = self
        
        taskView.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 12).isActive = true
        textView.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 16).isActive = true
        textView.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -16).isActive = true
        textView.bottomAnchor.constraint(equalTo: taskView.bottomAnchor, constant: -16).isActive = true
    }
    
    // Set attributes to statusLabel
    private func setupStatusLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.isUserInteractionEnabled = false
        var config = UIButton.Configuration.filled()
        config.title = "Low"
        config.attributedTitle?.font = .systemFont(ofSize: 14, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .black
        statusLabel.configuration = config
        
        self.view.addSubview(statusLabel)
        
        statusLabel.topAnchor.constraint(equalTo: taskView.bottomAnchor, constant: 12).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    // Set attributes to actionButton
    private func setupActionButtonn() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.tintColor = .white
        var config = UIButton.Configuration.filled()
        config.title = "Action"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = UIColor(red: 81/255, green: 169/255, blue: 228/255, alpha: 1)
        actionButton.configuration = config
        
        self.view.addSubview(actionButton)
        
        actionButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        actionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        actionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
    }
    
    // Set attributes to addButton
    private func setupRevisionButton() {
        revisionButton.translatesAutoresizingMaskIntoConstraints = false
        revisionButton.tintColor = .white
        var config = UIButton.Configuration.filled()
        config.title = "To revision"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = UIColor(red: 172/255, green: 184/255, blue: 191/255, alpha: 1)
        revisionButton.configuration = config
        
        self.view.addSubview(revisionButton)
        
        revisionButton.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12).isActive = true
        revisionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        revisionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        revisionButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
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
