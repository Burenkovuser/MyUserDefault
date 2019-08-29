//
//  ViewController.swift
//  MyUserDefault
//
//  Created by Vasilii on 29/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.isHidden = true
        
        //получаем сохраненные данные
        if let user = UserDefaults.standard.value(forKey: "userName") {
            userNameLabel.isHidden = false
            userNameLabel.text = user as? String
        }
    }
    
    @IBAction func donProcessed() {
        
        //проверяем что данные не пустые
        guard let fistName = firstNameTextField.text, !(fistName.isEmpty) else {
            wrongFormatAlert()
            return
        }
        guard let secondName = secondNameTextField.text, !(secondName.isEmpty) else {
            wrongFormatAlert()
            return
        }
        //проверяем чтобы не использовались числа
        if let _ = Double(fistName) {
            wrongFormatAlert()
        } else if let _ = Double(secondName) {
            wrongFormatAlert()
        } else {
            userNameLabel.isHidden = false
            userNameLabel.text = fistName + " " + secondName
            UserDefaults.standard.set(userNameLabel.text, forKey: "userName")//сохраняем значение
        }
        
        //стираем данные после нажатия кнопки
        firstNameTextField.text = nil
        secondNameTextField.text = nil
    }
    
}

extension ViewController {
    
    private func wrongFormatAlert() {
        
        let alert = UIAlertController(
            title: "Wrong Format!",
            message: "Please enter your name",
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
