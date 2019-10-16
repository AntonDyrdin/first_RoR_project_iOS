//
//  Project.swift
//  first_RoR_project_iOS
//
//  Created by Anton on 15.10.19.
//  Copyright © 2019 Anton. All rights reserved.
//

import Foundation

class Project: Decodable{
    var title: String
    var id: Int
    
    init(id: Int, title: String)
    {
        self.id = id
        self.title = title
    }
    
    init()
    {
        self.id = -1
        self.title = ""
    }
}

