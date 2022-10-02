//
//  TaskTableViewCell.swift
//  TasksBoard
//
//  Created by Olegio on 02.10.2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    let cellView = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 75))
    let taskLabel = UILabel(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 36, height: 20))
    let mark = UIView(frame: CGRect(x: 20, y: 0, width: 10, height: 10))
    let statusLabel = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        
        // Set attributes to cellView
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = CGColor(red: 233/255, green: 236/255, blue: 238/255, alpha: 1)
        cellView.layer.cornerRadius = 12
        
        // Set attributes to taskLabel
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        // Set attributes to mark
        mark.translatesAutoresizingMaskIntoConstraints = false
        mark.layer.cornerRadius = 5
        mark.clipsToBounds = true
        mark.backgroundColor = .blue
        
        // Set attributes to statusLabel
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.isUserInteractionEnabled = false
        var config = UIButton.Configuration.filled()
        config.title = "Low"
        config.attributedTitle?.font = .systemFont(ofSize: 14, weight: .medium)
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .black
        statusLabel.configuration = config
        
        // Add UI components
        cellView.addSubview(taskLabel)
        cellView.addSubview(mark)
        cellView.addSubview(statusLabel)
        contentView.addSubview(cellView)
        
        // Constraints
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        taskLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16).isActive = true
        taskLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16).isActive = true
        taskLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16).isActive = true
        taskLabel.bottomAnchor.constraint(equalTo: mark.topAnchor, constant: -19).isActive = true
        
        mark.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 19).isActive = true
        mark.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16).isActive = true
        mark.trailingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -12).isActive = true
        mark.widthAnchor.constraint(equalToConstant: 10).isActive = true
        mark.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        statusLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 12).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: mark.trailingAnchor, constant: 12).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
}
