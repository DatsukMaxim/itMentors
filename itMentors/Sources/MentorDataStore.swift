//
//  MentorDataStore.swift
//  itMentors
//
//  Created by Иван Дрожжин on 27.07.2022.
//

class MentorDataStore {
    let names = [
        "Василий", "Александр", "Евгений",
        "Афанасий", "Петр", "Алексей",
        "Георгий", "Иван", "Степан",
        "Борис", "Николай", "Константин",
        "Виталий", "Михаил", "Владислав",
        "Владимир", "Владлен", "Лев",
        "Егор", "Кузьма", "Тимофей",
        "Дмитрий", "Максим", "Карен",
        "Кирилл", "Илья", "Денис",
        "Павел", "Никита", "Игорь"
    ]
    let surnames = [
        "Петров", "Иванов", "Смирнов",
        "Осипов", "Коновалов", "Толстой",
        "Васечкин", "Калинин", "Малинин",
        "Меладзе", "Цискаридзе", "Лапочкин",
        "Айтишев", "Свифтов", "Котлин",
        "Паскалев", "Сишарпов", "Шарапов",
        "Питонов", "Гадюкин", "Ужев",
        "Никитин", "Цветков", "Горшков",
        "Ахметов", "Кайметов", "Цой",
        "Овечкин", "Березутский", "Буре"
    ]
    let cities = [
        "Москва", "Санкт-Петербург", "Сочи",
        "Казань", "Воронеж", "Краснодар",
        "Екатеринбург", "Ростов-на-Дону", "Новосибирск",
        "Нижний Новгород", "Новокузнецк", "Кемерово",
        "Владивосток", "Владикавказ", "Тверь",
        "Калуга", "Нальчик", "Сомленск",
        "Самара", "Севастополь", "Тамбов",
        "Тюмень", "Томск", "Омск",
        "Красноярск", "Калининград", "Петропавловск Камчатский",
        "Грозный", "Махачкала", "Мурманск",
        "Минск", "Астана", "Одинцово",
        "Можайск", "Йошкар-Ола", "Пенза"
    ]
    let scopes = [
        "Swift", "Objective-C", "Python",
        "JavaScript", "C#", "C++",
        "Kotlin", "PHP", "Delphi",
        "Golang", "Java"
    ]
    
    let reviews = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.",
        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
    ]
    
    let photos = ["bezos", "cook", "durov", "efimov", "gates", "ive", "musk"]
    
    var name: String {
        names.randomElement() ?? "Anonymous"
    }
    
    var surname: String {
        surnames.randomElement() ?? "Anonymous"
    }
    
    var city: String {
        cities.randomElement() ?? "Nowhere"
    }
    
    var scope: String {
        scopes.randomElement() ?? "Sandbox"
    }
    
    var review: String {
        reviews.randomElement() ?? "Lorem ipsum dolor sit amet"
    }
    
    var photo: String {
        photos.randomElement() ?? "No photo"
    }
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
}
