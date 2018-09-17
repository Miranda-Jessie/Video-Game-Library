//
//  Game Library.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 9/13/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

class Library {
    var gameArray : [Games] = [Games(title: "Beyond Two Souls"), Games(title: "Life Is Strange"), Games(title: "Detroit: Become Human"), Games(title: "GTA5"), Games(title: "The Walking Dead")]
    func addGame() {
        //Prompt user to enter tilte for new game to be added
        print("Please enter the title of the game you would like to add.")
        //Get title input from user and store in a variable
        var newGameTitle = readLine()
        //Check and make sure the input isn't nil or an empty string
        while newGameTitle == nil || newGameTitle == ""{
            print("Ivalid title. Enter a valid title.")
            newGameTitle = readLine()
        }
        //Instatantiate a new game with thr title from user input
        let newGame = Games(title: newGameTitle!)
        //Add new game objet to our game array.
        gameArray.append(newGame)
    }
    func listAvailableGames() {
        for game in gameArray {
            if game.checkedIn {
                print(game.title)
            }
        }
    }
    func removeGame() {
        //List all of our game titles with a number for the user to select
        for index in 1..<gameArray.count {
            print("\n\(index). \(gameArray[index].title)")
        }
        print("\nPlease enter the number of the game you would like to remove.")
        var userInput = Int(readLine()!)
        let validGameIndex = Array(1..<gameArray.count)
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid input. Please enter a useable index.")
            userInput = Int(readLine()!)
        }
        gameArray.remove(at: userInput!)
    }
    func checkOutGame() {
        //Loop through our game array and print index and title if game is availiable to be checked out
        for index in 1..<gameArray.count {
            if gameArray[index].checkedIn == true {
                print("\n\(index). \(gameArray[index].title)")
            }
        }
        print("\nPlease enter the number of the game you wish to check out: ")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input. Please enter a usable index.")
            userInput = Int(readLine()!)
        }
        //Change the checkedIn value of our game element at the index provided by the user
        gameArray[userInput!].checkedIn = false
        //USe calender to add time and establish dueDate
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        gameArray[userInput!].dueDate = dueDate
        //Use dateformat to print out date as a readable string for the user
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("\nthe game is due in two weeks on: \(dateFormatter.string(from: dueDate!))")
    }
    func checkGameIn() {
        //Loop through array of games and print checked out games in the index
        for index in 1..<gameArray.count {
            if gameArray[index].checkedIn == false {
                print("\(index). \(gameArray[index].title)")
            }
        }
        print("\nPlease enter the number of the game you would like to check in: ")
        var userInput = Int(readLine()!)
        while userInput == nil {
            print("Invalid input, please enter a usable index.")
            userInput = Int(readLine()!)
        }
        gameArray[userInput!].checkedIn = true
        //Remove the due date since the game has been returned
        gameArray[userInput!].dueDate = nil
    }
    func listUnavailableGames() {
        for game in gameArray {
            if !game.checkedIn {
                print(game.title)
            }
            if let dueDate = game.dueDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                print("\(game.title) is due on: \(dateFormatter.string(from: dueDate))")
            }
        }
    }
}
