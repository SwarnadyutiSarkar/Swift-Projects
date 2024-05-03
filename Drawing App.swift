import UIKit

class DrawingViewController: UIViewController {
    @IBOutlet weak var canvasView: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearCanvas(_ sender: UIButton) {
        canvasView.clearCanvas()
    }
}

class CanvasView: UIView {
    private var lines: [[CGPoint]] = []
    private var lastPoint: CGPoint!
    private var color: UIColor = .black
    private var brushWidth: CGFloat = 5.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineCap(.round)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        
        lines.forEach { (line) in
            for (i, point) in line.enumerated() {
                if i == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
        }
        
        context.strokePath()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        lastPoint = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let newPoint = touch.location(in: self)
        lines[lines.count - 1].append(newPoint)
        setNeedsDisplay()
        lastPoint = newPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([])
        setNeedsDisplay()
    }
    
    func clearCanvas() {
        lines.removeAll()
        setNeedsDisplay()
    }
}
