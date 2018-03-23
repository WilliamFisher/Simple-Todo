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
            cell.textLabel?.text = todo.name
            cell.textLabel?.textColor = UIColor.red
        } else {
            cell.textLabel?.text = todo.name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: todo)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .normal, title: "Complete") { action, index in
            self.todos.remove(at: indexPath.row)
            tableView.reloadData()
        }
        complete.backgroundColor = UIColor.blue
        
        return [complete]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddTodoViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteTodoViewController {
            if let todo = sender as? Todo {
                completeVC.selectedTodo = todo
                completeVC.previousVC = self
            }
        }
    }

}
