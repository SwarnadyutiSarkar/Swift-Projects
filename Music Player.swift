import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load audio file and initialize audio player
        if let path = Bundle.main.path(forResource: "example_song", ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            } catch {
                print("Error loading audio file: \(error)")
            }
        }
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        audioPlayer?.play()
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        audioPlayer?.pause()
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}
