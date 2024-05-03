import UIKit

class CurrencyConverterViewController: UIViewController {
    // Outlets
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
    // Variables
    let conversionRates: [String: Double] = ["USD": 1.0, "EUR": 0.83, "GBP": 0.72] // Example conversion rates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.text = ""
        resultLabel.text = "0.00"
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Double(amountText) else {
            resultLabel.text = "Invalid amount"
            return
        }
        
        let selectedCurrency = currencySegmentedControl.titleForSegment(at: currencySegmentedControl.selectedSegmentIndex)!
        let conversionRate = conversionRates[selectedCurrency]!
        let convertedAmount = amount * conversionRate
        resultLabel.text = String(format: "%.2f", convertedAmount)
    }
}
