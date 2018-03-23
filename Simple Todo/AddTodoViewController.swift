//
//  AddTodoViewController.swift
//  Simple Todo
//
//  Created by William Fisher on 3/23/18.
//  Copyright © 2018 William Fisher. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    var previousVC  = TodoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let todo = Todo()
        
        if let titleText = titleTextField.text {
            todo.name = titleText
            todo.isImportant = importantSwitch.isOn
            
            previousVC.todos.append(todo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    

}
