//
//  TodoTableViewController.swift
//  Simple Todo
//
//  Created by William Fisher on 3/23/18.
//  Copyright © 2018 William Fisher. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var todos : [TodoCoreData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTodos()
    }
    
    func getTodos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataTodos = try? context.fetch(TodoCoreData.fetchRequest()) as? [TodoCoreData] {
                if let theTodos = coreDataTodos {
                    todos = theTodos
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        if todo.important {
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddTodoViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteTodoViewController {
            if let todo = sender as? TodoCoreData {
                completeVC.selectedTodo = todo
                completeVC.previousVC = self
            }
        }
    }

}
