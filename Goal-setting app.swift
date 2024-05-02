import Foundation

class Goal {
    let name: String
    var target: Int
    var currentProgress: Int
    
    init(name: String, target: Int) {
        self.name = name
        self.target = target
        self.currentProgress = 0
    }
    
    func updateProgress(amount: Int) {
        currentProgress += amount
        print("Progress updated for goal '\(name)': \(currentProgress)/\(target)")
        
        if currentProgress >= target {
            print("Congratulations! Goal '\(name)' achieved!")
        }
    }
}

// Example usage
let fitnessGoal = Goal(name: "Fitness", target: 10000)
fitnessGoal.updateProgress(amount: 5000)
fitnessGoal.updateProgress(amount: 6000)
