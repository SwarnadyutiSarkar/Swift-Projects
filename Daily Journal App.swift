import Foundation

class DailyJournal {
    var entries: [String] = []
    
    func addEntry(entry: String) {
        entries.append(entry)
        print("Journal entry added: \(entry)")
    }
    
    func displayEntries() {
        print("Journal entries:")
        for (index, entry) in entries.enumerated() {
            print("\(index + 1). \(entry)")
        }
    }
}

// Example usage
let dailyJournal = DailyJournal()
dailyJournal.addEntry(entry: "Today was a great day!")
dailyJournal.addEntry(entry: "Feeling motivated.")
dailyJournal.displayEntries()
