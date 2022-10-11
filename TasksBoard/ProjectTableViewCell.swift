//
//  ProjectTableViewCell.swift
//  TasksBoard
//
//  Created by Olegio on 01.10.2022.
//

import UIKit

class ProjectTableViewCell: UITableViewCell, UITextViewDelegate {
    
    let cellView = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 75))
    let projectTextLabel = UILabel(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 36, height: 40))
    let infoLabel = UILabel(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.size.width - 36, height: 20))
    let detailButton = UIButton(type: .system)
    var updatedName = ""

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(red: 246/255, green: 248/255, blue: 249/255, alpha: 1)
        
        // Set attributes to cellView
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = CGColor(red: 233/255, green: 236/255, blue: 238/255, alpha: 1)
        cellView.layer.cornerRadius = 12
        
        
        // Set attributes to projectTextLabel
        projectTextLabel.translatesAutoresizingMaskIntoConstraints = false
        projectTextLabel.textColor = .black
        projectTextLabel.numberOfLines = 2
        projectTextLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        // Set attributes to infoLabel
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        infoLabel.textColor = .systemGray
        
        // Set attributes to detailButton
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        detailButton.tintColor = UIColor(red: 120/255, green: 110/255, blue: 232/255, alpha: 1)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "arrow.forward.circle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        config.imagePlacement = .all
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        detailButton.configuration = config
        
        // Add UI components
        cellView.addSubview(projectTextLabel)
        cellView.addSubview(infoLabel)
        cellView.addSubview(detailButton)
        contentView.addSubview(cellView)
        
        // Constraints
        cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        projectTextLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0).isActive = true
        projectTextLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20).isActive = true
        projectTextLabel.trailingAnchor.constraint(equalTo: detailButton.leadingAnchor, constant: -12).isActive = true
        projectTextLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -8).isActive = true
        
        infoLabel.topAnchor.constraint(equalTo: projectTextLabel.bottomAnchor, constant: 8).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16).isActive = true
        
        detailButton.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        detailButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16).isActive = true
        detailButton.leadingAnchor.constraint(equalTo: projectTextLabel.trailingAnchor, constant: 12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTheCell(for project: Project, in tableView: UITableView) {
       
    }
}
