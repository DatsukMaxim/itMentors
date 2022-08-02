//
//  ReviewTableViewController.swift
//  itMentors
//
//  Created by Renat Ibragimov on 01.08.2022.
//

import UIKit

class ReviewTableViewController: UITableViewController {
    
    var mentor: Mentor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Отзывы"
        navigationItem.backButtonTitle = ""
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 1...mentor.reviews.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Review", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(mentor.reviews[indexPath.row].reviewerName)"
        content.textProperties.font = UIFont.systemFont(ofSize: 25)
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 18)
        content.secondaryText = "\(mentor.reviews[indexPath.row].text)"
        cell.contentConfiguration = content
        return cell
    }
}
