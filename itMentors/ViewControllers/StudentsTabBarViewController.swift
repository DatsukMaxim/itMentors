//
//  StudentsTabBarViewController.swift
//  itMentors
//
//  Created by Renat Ibragimov on 02.08.2022.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    var mentor: Mentor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 1...mentor.students.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(mentor.students[indexPath.row].fullname)"
        content.textProperties.font = UIFont.systemFont(ofSize: 20)
        cell.contentConfiguration = content
        return cell
    }
    
}
