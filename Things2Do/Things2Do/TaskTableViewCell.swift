//
//  TaskTableViewCell.swift
//  Things2Do
//
//  Created by Adrian Wisaksana on 5/30/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    // MARK: - Actions
    
    func setupCellWithTask(task: Task) {
        
        taskNameLabel.text = task.name
        
    }

}
