//
//  Todo.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 15.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//

import Foundation

class Todo: Decodable, Encodable{
    var text: String
    var isCompleted: String
    var project_id: Int
    var id: Int
    
    init(id: Int, text: String,isCompleted: String,project_id: Int)
    {
        self.id = id
        self.text = text
        self.isCompleted = isCompleted
        self.project_id = project_id
    }
    init()
    {
        self.id = -1
        self.text = ""
        self.isCompleted = ""
        self.project_id = -1
    }
}
