import UIKit

class Podcast {
    let title: String
    let author: String
    let imageURL: URL
    let audioURL: URL
    
    init(title: String, author: String, imageURL: URL, audioURL: URL) {
        self.title = title
        self.author = author
        self.imageURL = imageURL
        self.audioURL = audioURL
    }
}

class PodcastViewController: UIViewController {
    // Example podcast data
    let podcasts: [Podcast] = [
        Podcast(title: "Podcast 1", author: "Author 1", imageURL: URL(string: "https://example.com/podcast1.jpg")!, audioURL: URL(string: "https://example.com/podcast1.mp3")!),
        Podcast(title: "Podcast 2", author: "Author 2", imageURL: URL(string: "https://example.com/podcast2.jpg")!, audioURL: URL(string: "https://example.com/podcast2.mp3")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load podcasts and display them
    }
}
