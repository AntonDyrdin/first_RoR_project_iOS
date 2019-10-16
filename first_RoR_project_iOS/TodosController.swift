//
//  ViewController.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 14.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//
import Foundation
import UIKit

import Alamofire

class TodosController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet weak var projectListView: UITableView!
    
 static  public let getTodosURL = "https://dyrdin-oblako-group.herokuapp.com/api/todos"
 static  public let getProjectsURL = "https://dyrdin-oblako-group.herokuapp.com/api/projects"
    
 static public  let createTodoURL = "https://dyrdin-oblako-group.herokuapp.com/projects/create"
 static public  let updateTodoURL = "https://dyrdin-oblako-group.herokuapp.com/projects/update"
    
    var projects: [Project]=[]
    var todos: [[Todo]]=[]
    var todoArray: [Todo]=[]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! UINavigationController
            var destVC = dest.viewControllers[0] as! AddTodoController
            destVC.projects = self.projects
    
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //возвращаем количество задач внутри проекта, который находим, используя section
        return todos[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        //возвращаем количество секций (проектов)
        return projects.count
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bothArraysAreReceived()
    {
        if(todoArray.count>0 && projects.count>0)
        {
            for j in 0..<projects.count{
                todos.append([])
                
                for i in 0..<todoArray.count{
                    if todoArray[i].project_id == projects[j].id{
                        todos[j].append(todoArray[i])
                    }
                }
            }
             self.projectListView.reloadData()
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 255/255.0, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        projectListView.dataSource=self
        projectListView.delegate=self
        
        todoArray=[]
        projects=[]
        todos=[[]]
        
        var responseTodoData = Data()
        //get todos
        Alamofire.request(TodosController.getTodosURL).responseJSON { response in
            responseTodoData = response.data!
            self.todoArray = try! JSONDecoder().decode(Array<Todo>.self, from: responseTodoData)
            self.bothArraysAreReceived()
        }
        
        var responseProjectsData = Data()
        //get projects
        Alamofire.request(TodosController.getProjectsURL).responseJSON { response in
            responseProjectsData = response.data!
            self.projects = try! JSONDecoder().decode(Array<Project>.self, from:responseProjectsData)
            self.bothArraysAreReceived()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //находим cell, используя Identifier, который установили в storyboard, и возвращаем cell для текущего индекса
        var cell =  tableView.dequeueReusableCell(withIdentifier: "todo_text", for: indexPath) as! TodoCell
        
        cell.setValues(todoModel: todos[indexPath.section][indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "header") as! SectionCell
        
        cell.projectNameView.text = projects[section].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 60.0
    }
    
    
    
    
}
