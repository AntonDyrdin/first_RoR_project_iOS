//
//  TodoCell.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 15.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//

import UIKit
import M13Checkbox

class TodoCell: UITableViewCell{
    

    @IBOutlet weak var todoTextView: UILabel!
    
    public let checkBox:M13Checkbox = M13Checkbox(frame: CGRect(x: 0, y: 0, width: 20.0, height: 20.0))
    
    public func setValues(text: String, isCompleted: Bool) {
        
        todoTextView.text = text
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.center = CGPoint(x: 40, y: self.bounds.midY)

        
        checkBox.boxType = M13Checkbox.BoxType.square
        checkBox.stateChangeAnimation=M13Checkbox.Animation.fade(M13Checkbox.AnimationStyle.fill)
        checkBox.cornerRadius=0;
        checkBox.animationDuration=0.1
        checkBox.secondaryCheckmarkTintColor = UIColor.white
        checkBox.secondaryTintColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1.0)
        checkBox.backgroundColor = UIColor.white
        checkBox.tintColor = UIColor(red: 0/255.0, green: 180/255.0, blue: 235/255.0, alpha: 1.0)
        checkBox.checkmarkLineWidth = 3
        
        self.addSubview(checkBox)
    }
    
}
