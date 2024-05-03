import UIKit

class Expense {
    let title: String
    let amount: Double
    let category: String
    
    init(title: String, amount: Double, category: String) {
        self.title = title
        self.amount = amount
        self.category = category
    }
}

class ExpenseTrackerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Load expenses
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath)
        let expense = expenses[indexPath.row]
        cell.textLabel?.text = expense.title
        cell.detailTextLabel?.text = "\(expense.amount) - \(expense.category)"
        return cell
    }
}
