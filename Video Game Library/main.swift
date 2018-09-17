//
//  main.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 9/10/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

print("Welcome to the Video Game Library\n")
let menu = Menu()
menu.go() //This handles running the logic loop for our video game library. Once we break out of this function, the librry will close
menu.getInput()

