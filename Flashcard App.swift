import UIKit

class Flashcard {
    let question: String
    let answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}

class FlashcardViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    // Example flashcards
    let flashcards: [Flashcard] = [
        Flashcard(question: "What is the capital of France?", answer: "Paris"),
        Flashcard(question: "What is 2 + 2?", answer: "4"),
        Flashcard(question: "What is the largest planet in our solar system?", answer: "Jupiter")
    ]
    
    var currentFlashcardIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let currentFlashcard = flashcards[currentFlashcardIndex]
        questionLabel.text = currentFlashcard.question
        answerLabel.text = ""
    }
    
    @IBAction func showAnswerButtonPressed(_ sender: UIButton) {
        let currentFlashcard = flashcards[currentFlashcardIndex]
        answerLabel.text = currentFlashcard.answer
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        currentFlashcardIndex = (currentFlashcardIndex + 1) % flashcards.count
        updateUI()
    }
}
