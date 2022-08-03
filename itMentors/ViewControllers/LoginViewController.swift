//
//  ViewController.swift
//  itMentors
//
//  Created by alexkarav on 26.07.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logoImage: UIImageView!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.layer.borderWidth = 1
        logoImage.layer.masksToBounds = false
        logoImage.layer.borderColor = UIColor.white.cgColor
        logoImage.layer.cornerRadius = logoImage.frame.height / 2
        logoImage.clipsToBounds = true
        loginTF.text = user.login
        passwordTF.text = user.password
    }
    
    @IBAction func loginBtnTapped() {
        if loginTF.text != user.login || passwordTF.text != user.password {
            showAllert(
                title: "Oops, you enter empty login or password🫥",
                message: "Enter correct password and login"
            )
        } else {
            performSegue(withIdentifier: "mainVC", sender: nil)
        }
    }
    
    @IBAction func forgotRegisterInfo(_ sender: UIButton) {
        sender.tag == 0
        ? showAllert(title: "Ничего страшного 😉", message: "Ваш логин: \(user.login)")
        : showAllert(title: "Ничего страшного 😉", message: "Ваш пароль: \(user.password)")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainVC" {
            guard let searchVC = segue.destination as? SearchViewController else { return }
            searchVC.user = user
        }
    }
}

// MARK: - Extensions
extension LoginViewController {
    func showAllert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
