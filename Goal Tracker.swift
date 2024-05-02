import Foundation

class GoalTracker {
    var goals: [String: Int] = [:]
    
    func setGoal(name: String, target: Int) {
        goals[name] = target
        print("Goal set: \(name) - Target: \(target)")
    }
    
    func updateProgress(name: String, progress: Int) {
        guard let target = goals[name] else {
            print("Goal '\(name)' not found.")
            return
        }
        
        print("Updating progress for goal '\(name)': \(progress)/\(target)")
        
        if progress >= target {
            print("Congratulations! Goal '\(name)' achieved!")
        }
    }
}

// Example usage
let goalTracker = GoalTracker()
goalTracker.setGoal(name: "Exercise", target: 30)
goalTracker.updateProgress(name: "Exercise", progress: 25)
goalTracker.updateProgress(name: "Exercise", progress: 30)
