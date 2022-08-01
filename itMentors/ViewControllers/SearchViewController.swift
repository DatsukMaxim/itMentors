//
//  SearchViewController.swift
//  itMentors
//
//  Created by igor s on 28.07.2022.
//

import UIKit

protocol UserDelegate {
    func setSelection(user: User)
}

class SearchViewController: UIViewController {
    //MARK: - IB Outlets
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    //MARK: - Public properties
    let mentorsList = Mentor.getMentorsList()
    var user: User!
    var cityPicker: UIPickerView!
    var activityPicker: UIPickerView!
    
    var cities: [String] {
        Array(Set(mentorsList.map { $0.city })).sorted(by: <)
    }
    var activities: [String] {
        Array(Set(mentorsList.map { $0.scope })).sorted(by: <)
    }

    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        searchButton.layer.cornerRadius = 10
        cityPicker = createPickerView(tag: 0)
        activityPicker = createPickerView(tag: 1)
        cityTextField.inputView = cityPicker
        activityTextField.inputView = activityPicker
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let userVC = segue.destination as? UserViewController {
            userVC.delegate = self
            userVC.user = user
        } else if let mentorsVC = segue.destination as? SearchResultsViewController {
            let selectedCity = cityTextField.text
            let selectedActivity = activityTextField.text
            
            guard selectedCity != "" || selectedActivity != "" else {
                showAlert(with: "Упс!🤔", and: "Выберите город и направление из списка")
                return
            }
            let sortedList = mentorsList.filter {
                ($0.city == selectedCity) && ($0.scope == selectedActivity)
                
            }
            if sortedList.isEmpty {
                self.showAlert(
                    with: "Упс!🤔",
                    and: "К сожалению, по данному запроусу пока нет подходящих менторов"
                )
                return
            }
            mentorsVC.mentorsList = sortedList
        }
    }
    
    //MARK: - Private Methods
    private func createPickerView(tag: Int) -> UIPickerView {
        let picker = UIPickerView()
        picker.delegate = self
        picker.tag = tag
        return picker
    }
    
    private func setUserSelection(city: String, activity: String) {
        guard let cityRow = cities.firstIndex(of: city),
              let activityRow = activities.firstIndex(of: activity)
        else { return }
        
        cityPicker.selectRow(cityRow, inComponent: 0, animated: true)
        activityPicker.selectRow(activityRow, inComponent: 0, animated: true)
        
        cityTextField.text = cities[cityPicker.selectedRow(inComponent: 0)]
        activityTextField.text = activities[activityPicker.selectedRow(inComponent: 0)]
    }
}

//MARK: - Picker View Data Source and Delegate
extension SearchViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //возвращает количество барабанов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //кол-во элементов, доступных в pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (pickerView.tag == 0) ? cities.count : activities.count
    }
    //позволяет отображать в каждой строке PickerView определенное значение
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return (pickerView.tag == 0) ? cities[row] : activities[row]
    }
    //позволяет работать с выбранным элементом
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.tag == 0 ?
        (cityTextField.text = cities[row]) : (activityTextField.text = activities[row])
    }
}

//MARK: - AlertController
extension SearchViewController {
    private func showAlert (with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - User Delegate
extension SearchViewController: UserDelegate {
    func setSelection(user: User) {
        setUserSelection(city: user.city, activity: user.activity)
    }
}
