//
//  NewTaskViewController.swift
//  TasksBoard
//
//  Created by Olegio on 03.10.2022.
//

import UIKit

class NewTaskViewController: UIViewController, UITextViewDelegate {
    
    private let placeholder = "Enter your task here..."
    
    let taskView = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 100))
    let textView = UITextView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 80))
    let rangSlider = UISlider(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 30))
    let lowLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
    let mediumLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
    let highLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 20, height: 20))
    let cancelButton = UIButton(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 43))
    let addButton = UIButton(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 43))

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        setupNavigationBar()
        setupTaskView()
        setupRangSlider()
        setupLowLabel()
        setupMediumLabel()
        setupHighLabel()
        setupCancelButton()
        setupAddButton()
    }
    
    private func setupNavigationBar() {
        title = "New task"
        
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
        taskView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -300).isActive = true
        
        setupTextView()
    }
    
    // Set attributes to textView
    private func setupTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = nil
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.text = placeholder
        textView.textColor = .systemGray
        textView.autocorrectionType = .no
        textView.delegate = self
        
        taskView.addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: taskView.topAnchor, constant: 12).isActive = true
        textView.leadingAnchor.constraint(equalTo: taskView.leadingAnchor, constant: 16).isActive = true
        textView.trailingAnchor.constraint(equalTo: taskView.trailingAnchor, constant: -16).isActive = true
        textView.bottomAnchor.constraint(equalTo: taskView.bottomAnchor, constant: -16).isActive = true
    }
    
    // Set attributes to rangSlider
    private func setupRangSlider() {
        rangSlider.translatesAutoresizingMaskIntoConstraints = false
        rangSlider.minimumValue = 0
        rangSlider.maximumValue = 5
        rangSlider.value = 1
        rangSlider.minimumTrackTintColor = UIColor(red: 101/255, green: 194/255, blue: 172/255, alpha: 1)
        
        rangSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        self.view.addSubview(rangSlider)
        
        rangSlider.topAnchor.constraint(equalTo: taskView.bottomAnchor, constant: 38).isActive = true
        rangSlider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        rangSlider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        rangSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc private func sliderChanged(slider: UISlider) {
        
        switch slider.value {
        case let x where x <= 2:
            rangSlider.minimumTrackTintColor = UIColor(red: 101/255, green: 194/255, blue: 172/255, alpha: 1)
        case let x where x <= 4:
            rangSlider.minimumTrackTintColor = UIColor(red: 242/255, green: 191/255, blue: 66/255, alpha: 1)
        case let x where x <= 5:
            rangSlider.minimumTrackTintColor = UIColor(red: 236/255, green: 96/255, blue: 103/255, alpha: 1)
        default:
            break
        }
    }
    
    // Set attributes to lowLabel
    private func setupLowLabel() {
        lowLabel.translatesAutoresizingMaskIntoConstraints = false
        lowLabel.text = "Low"
        lowLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lowLabel.textColor = .systemGray
        
        self.view.addSubview(lowLabel)
        
        lowLabel.topAnchor.constraint(equalTo: taskView.bottomAnchor, constant: 16).isActive = true
        lowLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
    }
    
    // Set attributes to mediumLabel
    private func setupMediumLabel() {
        mediumLabel.translatesAutoresizingMaskIntoConstraints = false
        mediumLabel.text = "Medium"
        mediumLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        mediumLabel.textColor = .systemGray
        
        self.view.addSubview(mediumLabel)
        
        mediumLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mediumLabel.topAnchor.constraint(equalTo: taskView.bottomAnchor, constant: 16).isActive = true
    }
    
    // Set attributes to highLabel
    private func setupHighLabel() {
        highLabel.translatesAutoresizingMaskIntoConstraints = false
        highLabel.text = "High"
        highLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        highLabel.textColor = .systemGray
        
        self.view.addSubview(highLabel)
        
        highLabel.topAnchor.constraint(equalTo: taskView.bottomAnchor, constant: 16).isActive = true
        highLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
    }
    
    // Set attributes to cancelButton
    private func setupCancelButton() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.tintColor = .white
        var config = UIButton.Configuration.filled()
        config.title = "Cancel"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = UIColor(red: 172/255, green: 184/255, blue: 191/255, alpha: 1)
        cancelButton.configuration = config
        
        self.view.addSubview(cancelButton)
        
        cancelButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
    }
    
    // Set attributes to addButton
    private func setupAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .white
        var config = UIButton.Configuration.filled()
        config.title = "Add task"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = UIColor(red: 120/255, green: 110/255, blue: 232/255, alpha: 1)
        addButton.configuration = config
        
        self.view.addSubview(addButton)
        
        addButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -12).isActive = true
        addButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
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
