//
//  Developer.swift
//  itMentors
//
//  Created by igor s on 28.07.2022.
//

import Foundation

struct Developer {
    let name: String
    let surname : String
    let telegram: String
    let city: String
    
    var fullname: String {
        name + " " + surname
    }
}

extension Developer {
    static func getDevelopersList() -> [Developer] {
        var developers: [Developer] = []
        
        let names = DeveloperData.shared.names
        let surnames = DeveloperData.shared.surnames
        let telegrams = DeveloperData.shared.telegrams
        let cities = DeveloperData.shared.cities
        
        let iterations = names.count
        
        for index in 0..<iterations {
            let developer = Developer(
                name: names[index],
                surname: surnames[index],
                telegram: telegrams[index],
                city: cities[index]
            )
            developers.append(developer)
        }
        return developers
    }
}
