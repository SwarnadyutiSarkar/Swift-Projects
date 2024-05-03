import Foundation

class HabitTracker {
    var habits: [String: Int] = [:]
    
    func addHabit(name: String) {
        habits[name] = 0
        print("Habit added: \(name)")
    }
    
    func incrementHabit(name: String) {
        if var count = habits[name] {
            count += 1
            habits[name] = count
            print("Habit '\(name)' incremented: \(count) times")
        } else {
            print("Habit '\(name)' not found.")
        }
    }
}

// Example usage
let habitTracker = HabitTracker()
habitTracker.addHabit(name: "Exercise")
habitTracker.incrementHabit(name: "Exercise")
habitTracker.incrementHabit(name: "Exercise")
