//
//  DeveloperDataStore.swift
//  itMentors
//
//  Created by igor s on 28.07.2022.
//

import Foundation

class DeveloperData {
    static let shared = DeveloperData()
    
    let names = [
        "Александр",
        "Иван",
        "Игорь",
        "Максим",
        "Ренат"
    ]
    let surnames = [
        "Караваев",
        "Дрожжин",
        "Попов",
        "Дацук",
        "Ибрагимов"
    ]
    let telegrams = [
        "pisuil",
        "i_drozhzh",
        "meetigor" ,
        "DatsukMaxim",
        "therenatibragimov"
    ]
    let cities = [
        "Москва",
        "Москва",
        "Казань",
        "Кемерово",
        "Санкт-Петербург"
    ]
    private init() {}
}
