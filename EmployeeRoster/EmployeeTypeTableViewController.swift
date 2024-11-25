//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Dakshdeep Singh on 25/11/24.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {
    
    var employeeType: EmployeeType?
    var delegate: EmployeeTypeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeTypeCell", for: indexPath)
        let type = EmployeeType.allCases[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = type.description
        cell.contentConfiguration = content
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeeType = EmployeeType.allCases[indexPath.row]
        tableView.reloadData()
        
        delegate?.employeeTypeTableViewController(self, didSelect: employeeType!)
    }

}
