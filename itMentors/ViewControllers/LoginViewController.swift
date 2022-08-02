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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.layer.borderWidth = 1
        logoImage.layer.masksToBounds = false
        logoImage.layer.borderColor = UIColor.white.cgColor
        logoImage.layer.cornerRadius = logoImage.frame.height / 2
        logoImage.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginTF.text = ""
        passwordTF.text = ""
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func loginBtnTapped() {
        if loginTF.text == "" && passwordTF.text == "" {
            showAllert(title: "Oops, you enter empty login or password🫥", message: "Enter correct password and login")
        } else {
            performSegue(withIdentifier: "mainVC", sender: nil)
        }
    }
    
    @IBAction func registrationBtnTapped() {
        showAllert(title: "Something went wrong", message: "Will be available in the next development iteration")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainVC" {
            let user = User(login: loginTF.text ?? "", password: passwordTF.text ?? "", preferedArea: nil, city: nil)
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
