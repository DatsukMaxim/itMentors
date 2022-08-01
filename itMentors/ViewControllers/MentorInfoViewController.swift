//
//  MentorInfoViewController.swift
//  itMentors
//
//  Created by Renat Ibragimov on 01.08.2022.
//

import UIKit

class MentorInfoViewController: UIViewController {
    
    @IBOutlet var mentorPhotoView: UIImageView!
    
    @IBOutlet var mentorNameLabel: UILabel!
    @IBOutlet var mentorLanguageLabel: UILabel!
    @IBOutlet var mentorCityLabel: UILabel!
    @IBOutlet var experienceLabel: UILabel!
    
    var mentor: Mentor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mentorLabelsSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mentorPhotoView.image = UIImage(named: mentor.photo)
        mentorPhotoView.layer.cornerRadius = mentorPhotoView.bounds.width / 2
    }
    
    //MARK: - Private Methods
    private func mentorLabelsSetup() {
        mentorNameLabel.text = mentor.fullname
        mentorLanguageLabel.text = mentor.scope
        mentorCityLabel.text = mentor.city
        experienceLabel.text = "Work experience - \(Int.random(in: 1...10)) years"
    }
}
