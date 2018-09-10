//
//  Game Class.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 9/10/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

class Games{
    let title: String
    var genre: String
    var checkedIn: Bool = true
    var dueDate: Date?
    var description: String
    
    init(title: String, genre: String, checkedIn: Bool, dueDate: Int, description: String){
        self.title = title
        self.genre = genre
        self.checkedIn = checkedIn
        self.description = description
    }
}
