.import UIKit

class Expense {
    let title: String
    let amount: Double
    let participants: [String]
    
    init(title: String, amount: Double, participants: [String]) {
        self.title = title
        self.amount = amount
        self.participants = participants
    }
}

class ExpenseViewController: UIViewController {
    // Example expenses
    let expenses: [Expense] = [
        Expense(title: "Dinner", amount: 50.0, participants: ["John", "Alice", "Bob"]),
        Expense(title: "Groceries", amount: 100.0, participants: ["Alice", "Bob"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load expenses and display them
    }
}
