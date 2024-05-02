import Foundation

class MindfulnessApp {
    var meditationTimer: Timer?
    var meditationDuration: TimeInterval = 0
    
    func startMeditation(duration: TimeInterval) {
        print("Starting meditation for \(duration) seconds...")
        meditationDuration = duration
        meditationTimer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { _ in
            print("Meditation completed.")
        }
    }
    
    func stopMeditation() {
        meditationTimer?.invalidate()
        meditationTimer = nil
        print("Meditation stopped.")
    }
}

// Example usage
let mindfulnessApp = MindfulnessApp()
mindfulnessApp.startMeditation(duration: 300) // Start a 5-minute meditation
DispatchQueue.main.asyncAfter(deadline: .now() + 300) {
    mindfulnessApp.stopMeditation() // Stop the meditation after 5 minutes
}
