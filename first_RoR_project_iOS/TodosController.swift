//
//  ViewController.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 14.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//
import Foundation
import UIKit
import M13Checkbox

class TodosController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    

    @IBOutlet weak var projectListView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //возвращаем количество задач внутри проекта, который находим, используя section
        return todos.count
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        
        //возвращаем количество секций (проектов)
        return projects.count
    }

    var todos=["todo1","todo2","todo3","todo4","todo5","todo6","todo7"]
    var projects=["Семья","Работа","Прочее"]
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 255/255.0, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        super.viewDidLoad()
        projectListView.dataSource=self
        projectListView.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //находим cell, используя Identifier, который установили в storyboard, и возвращаем cell для текущего индекса
        var cell =  tableView.dequeueReusableCell(withIdentifier: "todo_text", for: indexPath) as! TodoCell
        
        cell.setValues(text: todos[indexPath.row] + "    " + String(indexPath.row) + "   " + String(indexPath.section), isCompleted: false)
     
        return cell
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! SectionCell
        
        cell.projectNameView.text = "section"+String(section)
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
      
        return 60.0
    }
 
    

    
}
