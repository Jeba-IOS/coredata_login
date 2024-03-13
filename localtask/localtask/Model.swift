import Foundation

// MARK: - WelcomeElement
class WelcomeElement: Codable {
    let id, gender, email, name: String
    let mobile: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case gender, email, name, mobile
    }
    init() {
        id = ""
        gender = ""
        email = ""
        mobile = ""
        name = ""
    }
    init(id : String,gender: String,email: String,mobile :String,name : String) {
        
        self.id = id
        self.gender = gender
        self.email = email
        self.name = name
        self.mobile = mobile
    }
}

typealias Welcome = [WelcomeElement]
