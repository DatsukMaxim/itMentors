//
//  UserViewController.swift
//  itMentors
//
//  Created by igor s on 01.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var preferedAreaTF: UITextField!
    @IBOutlet weak var imageProfile: UIImageView!
    
    //MARK: Public propetries
    var delegate: SearchViewController!
    var user: User!
    var scopes: [String]!
    var preferedAreaPV = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferedAreaPV.delegate = self
        preferedAreaTF.inputView = preferedAreaPV
        imageProfile.layer.borderWidth = 1
        imageProfile.layer.masksToBounds = false
        imageProfile.layer.borderColor = UIColor.white.cgColor
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        imageProfile.clipsToBounds = true
    }
}

// MARK: Extensions
extension ProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        scopes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        scopes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        preferedAreaTF.text = scopes[row]
        delegate.setSelection(data: preferedAreaTF.text ?? "")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
