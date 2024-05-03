import UIKit

class Note {
    let title: String
    let content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

class NoteTakingViewController: UIViewController {
    // Example array to store notes
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load existing notes from storage
    }
    
    func saveNotesToStorage() {
        // Save notes array to storage (e.g., UserDefaults or CoreData)
    }
    
    @IBAction func addNoteButtonPressed(_ sender: UIButton) {
        // Display UI for adding a new note
        // Add the new note to the notes array
        let newNote = Note(title: "New Note", content: "Write your content here")
        notes.append(newNote)
        // Save notes to storage
        saveNotesToStorage()
    }
}
