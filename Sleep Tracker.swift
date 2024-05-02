import Foundation

class SleepTracker {
    var sleepDuration: TimeInterval = 0
    
    func startSleep() {
        print("Sleeping...")
    }
    
    func stopSleep() {
        print("Woke up.")
    }
    
    func recordSleepDuration(start: Date, end: Date) {
        sleepDuration = end.timeIntervalSince(start)
        print("Sleep duration: \(sleepDuration) seconds")
    }
}

// Example usage
let sleepTracker = SleepTracker()
let sleepStartTime = Date()
sleepTracker.startSleep() // Start sleep
// Simulate sleeping for 8 hours
let sleepEndTime = sleepStartTime.addingTimeInterval(8 * 60 * 60)
sleepTracker.recordSleepDuration(start: sleepStartTime, end: sleepEndTime)
sleepTracker.stopSleep() // Stop sleep
