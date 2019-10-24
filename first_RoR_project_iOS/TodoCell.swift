//
//  TodoCell.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 15.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//

import UIKit
import Alamofire

class TodoCell: UITableViewCell {
    /*, M13CheckboxDelegate
     
    func m13CheckboxStateChange(to state: M13CheckboxState) {
        tapFunction(sender: self)
    }*/
    
    var todoModel = Todo()
    
    @IBOutlet weak var todoTextView: UILabel!
    
   // public let checkBox:M13Checkbox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 24.0, height: 24.0))
    
    @IBOutlet weak var checkBox: UIImageView!
    
    var isViewLoaded = false
    public func loadView(todoModel: Todo)
    {
        if(!isViewLoaded){
        
            todoTextView.isUserInteractionEnabled = true
            checkBox.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
            checkBox.addGestureRecognizer(tap)
            isViewLoaded = true
        }
    }
    
    @objc func tapFunction(sender: Any) {
        
        if todoModel.isCompleted == "true"{
            todoModel.isCompleted = "false"
            checkBox.backgroundColor = UIColor.white
            todoTextView.attributedText = NSAttributedString(string: todoModel.text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleNone.rawValue ])
            let parameters: Parameters = ["todo_id": String(todoModel.id), "isCompleted": "false"]
            Alamofire.request(TodosController.updateTodoURL, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default)
        }
        else{
            todoModel.isCompleted = "true"
            checkBox.backgroundColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 235/255.0, alpha: 1.0)
            todoTextView.attributedText = NSAttributedString(string: todoModel.text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue ])
            let parameters: Parameters = ["todo_id": String(todoModel.id), "isCompleted": "true"]
            Alamofire.request(TodosController.updateTodoURL, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default)
        }
       
    }
    public func setValues( todoModel: Todo) {
            self.todoModel = todoModel
        loadView(todoModel: todoModel)
        
        todoTextView.text = self.todoModel.text
        
        if self.todoModel.isCompleted == "true"{
            
            todoTextView.attributedText = NSAttributedString(string: todoModel.text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue ])
           checkBox.backgroundColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 235/255.0, alpha: 1.0)
        }
        else{
             checkBox.backgroundColor = UIColor.white
        }
        
        self.addSubview(checkBox)
    }

}
