//
//  DevelopersListViewController.swift
//  itMentors
//
//  Created by igor popov s on 28.07.2022.
//

import UIKit

class DevelopersListViewController: UITableViewController {
    
    //MARK: - Private Properties
    let developers = Developer.getDevelopersList()
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.rowHeight = 100
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developer", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = developers[indexPath.row].fullname
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 17)
        content.secondaryText = "@" + developers[indexPath.row].telegram
        content.secondaryTextProperties.color = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14)
        content.image = UIImage(named: developers[indexPath.row].fullname)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let developerVC = segue.destination as? DeveloperViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        developerVC.developer = developers[indexPath.row]
    }
    
}
