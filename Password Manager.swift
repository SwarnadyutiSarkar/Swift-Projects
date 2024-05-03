import Foundation

class PasswordManager {
    var passwords: [String: String] = [:]
    
    func savePassword(service: String, password: String) {
        passwords[service] = password
        print("Password saved for service: \(service)")
    }
    
    func getPassword(service: String) -> String? {
        let password = passwords[service]
        print("Retrieved password for service: \(service)")
        return password
    }
}

// Example usage
let passwordManager = PasswordManager()
passwordManager.savePassword(service: "Email", password: "password123")
let retrievedPassword = passwordManager.getPassword(service: "Email")
