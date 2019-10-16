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
            self.todoModel = todoModel
            
            todoTextView.isUserInteractionEnabled = true
             checkBox.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
            //todoTextView.addGestureRecognizer(tap)
           
         //   tap.addTarget(checkBox, action: #selector(self.tapFunction))
            checkBox.addGestureRecognizer(tap)
            
          /*  checkBox.strokeWidth = 1
            checkBox.translatesAutoresizingMaskIntoConstraints = false
            checkBox.center = CGPoint(x: 40, y: self.bounds.midY)
            checkBox.strokeColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)
            checkBox.checkColor = UIColor.white
            checkBox.uncheckedColor = UIColor.white
            checkBox.backgroundColor = UIColor.white
            checkBox.tintColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 235/255.0, alpha: 1.0)
            checkBox.radius = 0*/
        
            isViewLoaded = true
        }
    }
    
    @objc func tapFunction(sender: Any) {
        
        if todoModel.isCompleted == "true"{
            todoModel.isCompleted = "false"
            // checkBox.checkState = M13CheckboxStateUnchecked
             checkBox.backgroundColor = UIColor.white
            todoTextView.attributedText = NSAttributedString(string: todoModel.text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleNone.rawValue ])
        }
        else{
            todoModel.isCompleted = "true"
           // checkBox.checkState = M13CheckboxStateChecked
             checkBox.backgroundColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 235/255.0, alpha: 1.0)
            todoTextView.attributedText = NSAttributedString(string: todoModel.text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue ])
        }
        let parameters: Parameters = ["todo_id": String(todoModel.id), "isCompleted": "false"]
        Alamofire.request(TodosController.updateTodoURL, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default)
    }
    public func setValues( todoModel: Todo) {
        loadView(todoModel: todoModel)
        
        todoTextView.text = self.todoModel.text
        
        if self.todoModel.isCompleted == "true"{
            
            todoTextView.attributedText = NSAttributedString(string: todoModel.text, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue ])
           checkBox.backgroundColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 235/255.0, alpha: 1.0)
          //  checkBox.checkState = M13CheckboxStateChecked
        }
        else{
             checkBox.backgroundColor = UIColor.white
          //  checkBox.checkState = M13CheckboxStateUnchecked
        }
        
        self.addSubview(checkBox)
    }

}
