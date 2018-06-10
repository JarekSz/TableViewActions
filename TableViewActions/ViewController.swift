//
//  ViewController.swift
//  TableViewActions
//
//  Created by Jaroslaw Szymczyk on 6/10/18.
//  Copyright © 2018 Jaroslaw Szymczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSource = ["abc","nbc","cbc","cbs"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellIdentifier: String = "Cell"
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! TableViewCell
        
        cell.name.text = dataSource[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Editing
    
    // Individual rows can opt out of having the -editing property set for them. If not implemented, all rows are assumed to be editable.
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "delete", handler: {(action, index) in
            
        })
        delete.backgroundColor = .blue
        
        let add = UITableViewRowAction(style: .default, title: "add", handler: {(action, index) in
            
        })
        add.backgroundColor = .green
        
        return [delete, add]
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var configActions = UISwipeActionsConfiguration()
        
        let delete = UIContextualAction(style: .normal, title: "delete", handler: {(_, _, completionHandler) in
            print("delete")
        })
        delete.backgroundColor = .blue
        
        let add = UIContextualAction(style: .normal, title: "add", handler: {(_, _, completionHandler) in
            print("add")
        })
        add.backgroundColor = .green
        
        configActions = UISwipeActionsConfiguration(actions: [delete, add])
        
        configActions.performsFirstActionWithFullSwipe = false
        
        return configActions
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var configActions = UISwipeActionsConfiguration()
        
        let delete = UIContextualAction(style: .normal, title: "delete", handler: {(_, _, completionHandler) in
            print("delete")
        })
        delete.backgroundColor = .blue
        
        let add = UIContextualAction(style: .normal, title: "add", handler: {(_, _, completionHandler) in
            print("add")
        })
        add.backgroundColor = .green

        configActions = UISwipeActionsConfiguration(actions: [delete, add])

        configActions.performsFirstActionWithFullSwipe = false
        
        return configActions
    }
    
    // Data manipulation - insert and delete support
    
    // After a row has the minus or plus button invoked (based on the UITableViewCellEditingStyle for the cell), the dataSource must commit the change
    // Not called for edit actions using UITableViewRowAction - the action's handler will be invoked instead
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print("commit editingStyle: \(editingStyle)")
    }

}

