//
//  Menu.swift
//  Video Game Library
//
//  Created by Miranda Jessie on 9/11/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

class Menu {
    let gameLibrary = Library()
    var shouldQuit = false //When this is true, we should quit running the video game library.
    func go() { //This function will handle making the menu right. It will display the menu and take user input until the user wishes to quit the application.
        while !shouldQuit {
            printMenu()
            var input = getInput()
            while validateInput(input) == false {
                //display the menu again
                printMenu()
                //Get new input
                input = getInput()
            }
            handleInput(input)
        }
    }
    func validateInput(_ input: String) -> Bool{
        let validMenuOptions = Array(1...8)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
    }
    
    func printMenu() {
        //This should contain a print statement that prints out a formatted list of options.
        print("\nSelect an option that you would like to do.")
        print("""
                1. Add game
                2. Remove Game
                3. List Available Games
                4. Check Out Game
                5. Check In Game
                6. List Checked Out Games
                7. print menu
                8. Quit

                Please enter a number between 1 and 8
                """)
    }
    //Make a function called handleInput that takes our user input as a parameter and depending on what they enter print out what we would do.
    func handleInput(_ input: String) {
        switch input {
        case "1":
            //Call the library's Add Game function
            gameLibrary.addGame()
        case "2":
            //Call the library's remove game function
            gameLibrary.removeGame()
        case "3":
            //Call the list of availabe games functions
            gameLibrary.listAvailableGames()
        case "4":
            //Call the check out game function
            gameLibrary.checkOutGame()
        case "5":
            //Call the check in game function
            gameLibrary.checkGameIn()
        case "6":
            //Call the list checked out game function
            gameLibrary.listUnavailableGames()
        case "7":
            //call the printMenu function
            printMenu()
        case "8":
            //Call the quit function
            quit()
        default:
            break
        }
    }
    
    func quit() { //This function will be called when the user is ready to quit the application.
        //Since the user is ready to quit, set shouldQuit = true
        shouldQuit = true
        //Show the user a message
        print("\nThank you for using the application.")
        
    }
    
    func getInput() -> String {
        var userInput = readLine()
        while userInput == nil || userInput == "" {
            print("Please give a valid input")
            userInput = readLine()
        }
        return userInput!
    }
}
