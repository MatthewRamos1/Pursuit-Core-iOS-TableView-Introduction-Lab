//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortingButton: UIBarButtonItem!
    
    var tasks = [[Task]]()
    var isAscending = true {
        didSet {
            isAscending == true ? (sortingButton.title = "Sort Ascending") :
            (sortingButton.title = "Sort Descending")
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tasks = Task.getSections(isAscending)
    }

    @IBAction func sortingButtonPressed(_ sender: UIBarButtonItem) {
        isAscending.toggle()
        tasks = Task.getSections(isAscending)
        tableView.reloadData()

        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tasks[section].first?.status {
        case .notStarted:
            return "Not Started"
        case .inProgress:
            return "In Progress"
        case .completed:
            return "Completed"
        default:
            return "Invalid"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description
        return cell
    }

}
