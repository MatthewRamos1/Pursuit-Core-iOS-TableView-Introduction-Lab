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
    
    var tasks = [[Task]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tasks = Task.getSections()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks[section].count
    }
    
   

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description
        return cell
    }

}
