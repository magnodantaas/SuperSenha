//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Magno Miranda Dantas on 15/04/21.
//

import Foundation

class PasswordGenerator {
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool!
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let numbers = "0123456789"
    private let specialCharacters = "!@#$%ˆ&*()_-+=~`|}]{[':;?/<>.,"
    
    init(numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool!) {
        
        var numChar = min(numberOfCharacters, 16)
        numChar = max(numChar, 1)
        self.numberOfCharacters = numChar
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
         
        if useLetters {
            universe += letters
        }
        if useNumbers {
            universe += numbers
        }
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password: String = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
