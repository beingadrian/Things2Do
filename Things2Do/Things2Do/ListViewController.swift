//
//  ListViewController.swift
//  Things2Do
//
//  Created by Adrian Wisaksana on 5/30/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    // MARK: - Main methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup table view
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let newTaskViewController = segue.destinationViewController as? NewTaskViewController else {
            return
        }
        
        newTaskViewController.listViewController = self
        
    }
    
    // MARK: - Actions
    
    @IBAction func onAddButtonTap(sender: UIBarButtonItem) {
        
        performSegueWithIdentifier("AddTaskSegue", sender: self)
        
    }

}

extension ListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let action = UITableViewRowAction(style: .Destructive, title: "Complete") {
            (action, indexPath) in
            
            self.tasks.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
            
        }
        
        return [action]
        
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCellWithIdentifier("TaskTableViewCell") as? TaskTableViewCell else {
            fatalError("Cannot dequeue cell with identifier TaskTableViewCell")
        }
        
        let task = tasks[indexPath.row]
        
        cell.setupCellWithTask(task)
        
        return cell
        
    }
    
}
