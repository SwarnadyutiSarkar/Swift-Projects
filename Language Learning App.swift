import UIKit

class LanguageLearningViewController: UIViewController {
    // Example data for language learning
    let vocabulary: [String: String] = [
        "Apple": "Manzana",
        "House": "Casa",
        "Hello": "Hola"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Display language learning content
    }
    
    // Function to display vocabulary in a UI
    func displayVocabulary() {
        for (english, spanish) in vocabulary {
            print("\(english) - \(spanish)")
        }
    }
}
