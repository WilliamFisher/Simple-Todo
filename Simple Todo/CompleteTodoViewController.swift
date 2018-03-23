//
//  CompleteTodoViewController.swift
//  Simple Todo
//
//  Created by William Fisher on 3/23/18.
//  Copyright © 2018 William Fisher. All rights reserved.
//

import UIKit

class CompleteTodoViewController: UIViewController {
    
    var previousVC = TodoTableViewController()
    var selectedTodo = Todo()
    
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedTodo.name
    }
    
    @IBAction func completeAction(_ sender: Any) {
        var index = 0
        for todo in previousVC.todos {
            if todo.name == selectedTodo.name {
                previousVC.todos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
    }
    

}
