import UIKit

class TranslatorViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var translationLabel: UILabel!
    
    // Function to translate text
    func translateText(text: String) -> String {
        // Your translation logic here
        return "Translated: \(text)"
    }
    
    @IBAction func translateButtonPressed(_ sender: UIButton) {
        guard let inputText = inputTextField.text else { return }
        let translatedText = translateText(text: inputText)
        translationLabel.text = translatedText
    }
}
