//
//  ViewController.swift
//  Todo
//
//  Created by 🧔🏻Alikhan Batchaev on 14.03.2020.
//  Copyright © 2020 Alikhan Batchaev. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Найти собаку", "Прочитать книгу", "Сходить в магазин"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - TableView Datasource Method
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
}

