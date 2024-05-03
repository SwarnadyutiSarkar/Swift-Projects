import UIKit

class Message {
    let sender: String
    let content: String
    let timestamp: Date
    
    init(sender: String, content: String) {
        self.sender = sender
        self.content = content
        self.timestamp = Date()
    }
}

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Load chat messages
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        let message = messages[indexPath.row]
        cell.textLabel?.text = "\(message.sender): \(message.content)"
        return cell
    }
}
