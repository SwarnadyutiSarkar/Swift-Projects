import UIKit

class Question {
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}

class TriviaQuizViewController: UIViewController {
    // Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    // Variables
    var questionIndex = 0
    let questions = [
        Question(text: "Paris is the capital of France.", correctAnswer: true),
        Question(text: "The Great Wall of China is visible from space.", correctAnswer: false),
        Question(text: "The human skeleton is made up of less than 100 bones.", correctAnswer: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            checkAnswer(true)
        } else if sender.tag == 2 {
            checkAnswer(false)
        }
        questionIndex += 1
        updateUI()
    }
    
    func updateUI() {
        if questionIndex < questions.count {
            questionLabel.text = questions[questionIndex].questionText
        } else {
            let alert = UIAlertController(title: "Finished!", message: "You've reached the end of the quiz.", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func checkAnswer(_ userAnswer: Bool) {
        let correctAnswer = questions[questionIndex].answer
        if userAnswer == correctAnswer {
            print("Correct!")
        } else {
            print("Wrong!")
        }
    }
    
    func startOver()
