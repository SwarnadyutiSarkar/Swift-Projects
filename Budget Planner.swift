import Foundation

class BudgetPlanner {
    var expenses: [String: Double] = [:]
    
    func addExpense(category: String, amount: Double) {
        if let existingExpense = expenses[category] {
            expenses[category] = existingExpense + amount
        } else {
            expenses[category] = amount
        }
        print("Expense added: \(category) - $\(amount)")
    }
    
    func getTotalExpense() -> Double {
        let totalExpense = expenses.values.reduce(0, +)
        print("Total Expense: $\(totalExpense)")
        return totalExpense
    }
}

// Example usage
let budgetPlanner = BudgetPlanner()
budgetPlanner.addExpense(category: "Groceries", amount: 50.0)
budgetPlanner.addExpense(category: "Transportation", amount: 30.0)
let totalExpense = budgetPlanner.getTotalExpense()
