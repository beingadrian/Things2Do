//
//  NewTaskViewController.swift
//  Things2Do
//
//  Created by Adrian Wisaksana on 5/30/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    weak var listViewController: ListViewController?
    
    // MARK: - Main methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    // MARK: - Actions

    @IBAction func onAddButtonTap(sender: UIBarButtonItem) {
        
        guard let taskName = taskNameTextField.text else {
            return
        }
        
        guard taskName != "" else { return }
        
        let task = Task(name: taskName)
        
        listViewController?.tasks.append(task)
        
        listViewController?.tableView.reloadData()
        
        navigationController?.popViewControllerAnimated(true)
        
    }

}
