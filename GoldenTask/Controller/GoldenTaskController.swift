//
//  ViewController.swift
//  GoldenTask
//
//  Created by Maciej Sołoducha on 04/11/2022.
//

import UIKit

class GoldenTaskController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    // MARK: - Add New Item Button
    @IBAction func AddButton(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Task", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.setValue(self.itemArray, forKey: "WorkTaskListArray")
            self.tableView.reloadData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new task"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "First Task"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Second Task"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Third Task"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "WorkTaskListArray") as? [Item] {
            itemArray = items
         }
        
    }


    // MARK: - TableView
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        if itemArray[indexPath.row].done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if itemArray[indexPath.row].done == false {
            itemArray[indexPath.row].done = true
        } else {
            itemArray[indexPath.row].done = false
        }
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    
}

}


