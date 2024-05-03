import UIKit

class CalculatorViewController: UIViewController {
    // Outlets
    @IBOutlet weak var displayLabel: UILabel!
    
    // Variables
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operation: String = ""
    var isTypingNumber: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isTypingNumber {
            displayLabel.text! += digit
        } else {
            displayLabel.text = digit
            isTypingNumber = true
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        operation = sender.currentTitle!
        firstOperand = Double(displayLabel.text!)!
        isTypingNumber = false
    }
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        if isTypingNumber {
            secondOperand = Double(displayLabel.text!)!
        }
        
        var result: Double = 0
        switch operation {
        case "+":
            result = firstOperand + secondOperand
        case "-":
            result = firstOperand - secondOperand
        case "×":
            result = firstOperand * secondOperand
        case "÷":
            result = firstOperand / secondOperand
        default:
            break
        }
        
        displayLabel.text = "\(result)"
        isTypingNumber = false
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        displayLabel.text = "0"
        firstOperand = 0
        secondOperand = 0
        isTypingNumber = false
    }
}
