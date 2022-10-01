//
//  ProjectTableViewCell.swift
//  TasksBoard
//
//  Created by Olegio on 01.10.2022.
//

import UIKit

class ProjectTableViewCell: UITableViewCell, UITextViewDelegate {
    
    let cellView = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 75))
    let projectTextView = UITextView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 36, height: 40))
    let infoLabel = UILabel(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 36, height: 20))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        
        // Set attributes to cellView
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = CGColor(red: 233/255, green: 236/255, blue: 238/255, alpha: 1)
        cellView.layer.cornerRadius = 12
        
        
        // Set attributes to projectTextView
        projectTextView.translatesAutoresizingMaskIntoConstraints = false
        projectTextView.backgroundColor = nil
        projectTextView.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        projectTextView.autocorrectionType = .no
        projectTextView.delegate = self
        
        // Set attributes to infoLabel
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        infoLabel.textColor = .systemGray
        
        // Add UI components
        cellView.addSubview(projectTextView)
        cellView.addSubview(infoLabel)
        contentView.addSubview(cellView)
        
        // Constraints
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        projectTextView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 12).isActive = true
        projectTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16).isActive = true
        projectTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16).isActive = true
        projectTextView.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -8).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: projectTextView.bottomAnchor, constant: 8).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
}
