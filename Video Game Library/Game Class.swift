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
    var checkedIn: Bool = true
    var dueDate: Date?
    
    init(title: String){
        self.title = title
    }
}
