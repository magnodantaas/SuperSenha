//
//  PasswordsViewController.swift
//  SuperSenha
//
//  Created by Magno Miranda Dantas on 15/04/21.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var twPasswords: UITextView!
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    @IBOutlet weak var navItem: UINavigationItem!
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
    
        generatorPasswords()
    }
    
    func generatorPasswords() {
        twPasswords.scrollRangeToVisible(_NSRange(location: 0, length: 0))
        twPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            twPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: Any) {
        generatorPasswords()
    }
    

}
