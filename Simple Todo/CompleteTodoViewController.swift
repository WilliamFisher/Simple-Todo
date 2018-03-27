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
    var selectedTodo : TodoCoreData?
    
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedTodo?.name
    }
    
    @IBAction func completeAction(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theTodo = selectedTodo {
                context.delete(theTodo)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    

}
