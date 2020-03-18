//
//  ViewController.swift
//  Todo
//
//  Created by 🧔🏻Alikhan Batchaev on 14.03.2020.
//  Copyright © 2020 Alikhan Batchaev. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Найти собаку"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Купить хлеб"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Прогулка"
        itemArray.append(newItem3)
        
        //        // Show new items
        //        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
        //            itemArray = items
        //        }
        
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // Checkmark when highlighting and unchecking. Ternary operator
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Добавить новый элемент", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Добавить", style: .default) { (action) in
            
            // Add new item
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            // Save updated item array
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            // Reloads the rows and sections of the table view. New item displayed
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Создать новый элемент"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil )
    }
    
}

