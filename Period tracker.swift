import Foundation

class PeriodTracker {
    var periodStartDates: [Date] = []
    
    func addPeriodStartDate(date: Date) {
        periodStartDates.append(date)
        print("Period start date added: \(date)")
    }
    
    func predictNextPeriodStartDate() -> Date? {
        guard let lastPeriodStartDate = periodStartDates.last else {
            print("No period start dates available.")
            return nil
        }
        
        // Assuming average menstrual cycle length is 28 days
        let nextPeriodStartDate = Calendar.current.date(byAdding: .day, value: 28, to: lastPeriodStartDate)
        print("Predicted next period start date: \(nextPeriodStartDate ?? Date())")
        return nextPeriodStartDate
    }
}

// Example usage
let periodTracker = PeriodTracker()
periodTracker.addPeriodStartDate(date: Date(timeIntervalSinceNow: -30 * 24 * 60 * 60)) // Add a period start date 30 days ago
periodTracker.predictNextPeriodStartDate() // Predict the next period start date
