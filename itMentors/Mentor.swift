//
//  Mentor.swift
//  itMentors
//
//  Created by Иван Дрожжин on 26.07.2022.
//

import Foundation

struct Mentor {
    let name: String
    let surname: String
    
    let city: String
    let scope: String
    
    let reviews: [Review]
    let students: [Student]
    
    let photo: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getMentorsList() -> [Mentor] {
        var result: [Mentor] = []
        let data = MentorDataStore()
        
        for _ in 1...100 {
            result.append(
                Mentor(
                    name: data.name,
                    surname: data.surname,
                    city: data.city,
                    scope: data.scope,
                    reviews: Review.getReviews(),
                    students: Student.getStudents(),
                    photo: data.photo
                )
            )
        }
        
        return result
    }
}

struct Review {
    let reviewerName: String
    let rating: Int
    let text: String
    
    static func getReviews() -> [Review] {
        var result: [Review] = []
        let data = MentorDataStore()
        
        for _ in 0...Int.random(in: 1...10) {
            result.append(
                Review(
                    reviewerName: data.fullName,
                    rating: Int.random(in: 1...5),
                    text: data.review
                )
            )
        }
        
        return result
    }
}

struct Student {
    let name: String
    let surname: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getStudents() -> [Student] {
        var result: [Student] = []
        let data = MentorDataStore()
        
        for _ in 0...Int.random(in: 1...10) {
            result.append(
                Student(
                    name: data.name,
                    surname: data.surname
                )
            )
        }
        
        return result
    }
}
