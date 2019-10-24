//
//  AddTodoController.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 14.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AddTodoController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
   var projects: [Project]=[]
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var projectNameListView: UITableView!
    @IBOutlet weak var todoTextEditVeiw: UITextField!
    
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 255/255.0, alpha: 1.0)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        super.viewDidLoad()
        projectNameListView.dataSource=self
        projectNameListView.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  tableView.dequeueReusableCell(withIdentifier: "project_name", for: indexPath) as! ProjectNameCell
        
        cell.projectNameView.text = projects[indexPath.row].title
        
        return cell
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    @IBAction func save(_ sender: Any) {
        if (todoTextEditVeiw.text != ""){
        //отправка на сервер нового todo
        let parameters: Parameters = ["text": todoTextEditVeiw.text,
                                      "project": projects[projectNameListView.indexPathForSelectedRow!.row].title]
        
            Alamofire.request(TodosController.createTodoURL, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default).response{response in
                self.navigationController?.popViewController(animated: true)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }  
}
