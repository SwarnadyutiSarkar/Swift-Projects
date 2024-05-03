import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.dataSource = self
        calendar.delegate = self
    }
    
    // MARK: - FSCalendarDataSource
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    // MARK: - FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // Handle date selection
    }
}
