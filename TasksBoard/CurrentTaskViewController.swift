//
//  CurrentTaskViewController.swift
//  TasksBoard
//
//  Created by Olegio on 04.10.2022.
//

import UIKit

class CurrentTaskViewController: UIViewController, UITextViewDelegate {
    
    private let placeholder = "Enter Task Name..."
    
    // Recieved object from TasksTableViewController
    private var currentTask: Task!
    
    let taskView = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 60))
    let textView = UITextView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 80))
    let statusLabel = UIButton(type: .system)
    let actionButton = UIButton(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 43))
    let revisionButton = UIButton(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 43))
    
    init(currentTask: Task?) {
        self.currentTask = currentTask
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        addDoneButtonOnKeyboard()
    }
    
    private func setupNavigationBar() {
        title = "Task"
        
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
        textView.text = currentTask.name
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
        config.cornerStyle = .capsule
        
        switch currentTask.taskPriority {
        case .low:
            config.title = currentTask.taskPriority.rawValue
            config.baseBackgroundColor = UIColor(red: 101/255, green: 194/255, blue: 172/255, alpha: 1)
            config.attributedTitle?.font = .systemFont(ofSize: 16, weight: .medium)
            statusLabel.configuration = config
        case .medium:
            config.title = currentTask.taskPriority.rawValue
            config.baseBackgroundColor = UIColor(red: 242/255, green: 191/255, blue: 66/255, alpha: 1)
            config.attributedTitle?.font = .systemFont(ofSize: 16, weight: .medium)
            statusLabel.configuration = config
        case .high:
            config.title = currentTask.taskPriority.rawValue
            config.baseBackgroundColor = UIColor(red: 236/255, green: 96/255, blue: 103/255, alpha: 1)
            config.attributedTitle?.font = .systemFont(ofSize: 16, weight: .medium)
            statusLabel.configuration = config
        }
        
        self.view.addSubview(statusLabel)
        
        statusLabel.topAnchor.constraint(equalTo: taskView.bottomAnchor, constant: 12).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    // Set attributes to actionButton
    private func setupActionButtonn() {
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.tintColor = .white
        
        var buttonTitle = ""
        
        switch currentTask.taskCategory {
        case .new: buttonTitle = "To Work"
        case .inProgress: buttonTitle = "To Review"
        case .review: buttonTitle = "Done"
        case .done: actionButton.isHidden = true
        }
        
        var config = UIButton.Configuration.filled()
        config.title = buttonTitle
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = UIColor(red: 81/255, green: 169/255, blue: 228/255, alpha: 1)
        actionButton.configuration = config
        
        self.view.addSubview(actionButton)
        
        actionButton.addTarget(self, action: #selector(actionButtonAction), for: .touchUpInside)
        
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
        config.title = "Return For Revision"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = UIColor(red: 172/255, green: 184/255, blue: 191/255, alpha: 1)
        revisionButton.configuration = config
        
        self.view.addSubview(revisionButton)
        
        revisionButton.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12).isActive = true
        revisionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        revisionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        revisionButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        if currentTask.taskCategory != .review {
            revisionButton.isHidden = true
        }
    }
    
    // Action for actionButton
    @objc private func actionButtonAction() {
        if textView.text == placeholder || textView.text == "Enter Task Name" {
            taskView.layer.borderColor = CGColor(red: 236/255, green: 96/255, blue: 103/255, alpha: 1)
            textView.text = "Enter Task Name"
            textView.textColor = .systemRed
        } else {
            switch actionButton.titleLabel?.text {
            case "To Work":
                StorageManager.editTaskName(currentTask, newValue: currentTask.name)
                StorageManager.editTaskCategory(currentTask, newValue: .inProgress)
                navigationController?.popViewController(animated: true)
            case "To Review":
                StorageManager.editTaskName(currentTask, newValue: currentTask.name)
                StorageManager.editTaskCategory(currentTask, newValue: .review)
                navigationController?.popViewController(animated: true)
            case "Done":
                StorageManager.editTaskName(currentTask, newValue: currentTask.name)
                StorageManager.editTaskCategory(currentTask, newValue: .done)
                navigationController?.popViewController(animated: true)
            default:
                break
            }
        }
    }
    
    // Method for delete Task
    @objc private func deleteTask() {
        
    }
}


// MARK: - Extension for UITextViewDelegate

extension CurrentTaskViewController {
    
    // Hide keyboard on touch on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // Add Done Button on keyboard
    func addDoneButtonOnKeyboard() {
        let doneToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolBar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))

        let items = [flexSpace, doneButton]
        doneToolBar.items = items
        doneToolBar.sizeToFit()

        textView.inputAccessoryView = doneToolBar
    }
    
    @objc private func doneButtonAction() {
        textView.resignFirstResponder()
    }
    
    // Clear placeholder text when begin editing
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == "" || textView.text == placeholder {
            textView.text = nil
            textView.textColor = .black
        }
        if textView.text == "Enter Task Name" {
            textView.text = nil
            textView.textColor = .black
            taskView.layer.borderColor = CGColor(red: 233/255, green: 236/255, blue: 238/255, alpha: 1)
        }
        return true
    }
    
    // Set placeholder text if text is ""
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = placeholder
            textView.textColor = .systemGray
        } else {
            StorageManager.editTaskName(currentTask, newValue: textView.text)
        }
    }
}
