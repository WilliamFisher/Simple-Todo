//
//  TodoTableViewController.swift
//  Simple Todo
//
//  Created by William Fisher on 3/23/18.
//  Copyright © 2018 William Fisher. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todos : [Todo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        todos = createTodos()
    }
    
    func createTodos() -> [Todo] {
        
        let homework = Todo()
        homework.name = "Homework"
        homework.isImportant = true
        
        let dog = Todo()
        dog.name = "Walk the dog"
        dog.isImportant = false
        
        return [homework,dog]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        if todo.isImportant {
            cell.textLabel?.text = "❗️" + todo.name
        } else {
            cell.textLabel?.text = todo.name
        }

        return cell
    }

}
