// MARK: Frameworks

import UIKit

// MARK: ViewController

class ShapeViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet var shapeView: UIView!
    @IBOutlet var buttonView: UIView!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var previousButton: UIButton!

    // MARK: Variables
    
    var shapes: [CAShapeLayer] = []
    var currentShape: CAShapeLayer? {
        didSet {
            shapeView.layer.sublayers?.removeAll()
            shapeView.layer.addSublayer(currentShape!)
        }
    }
    
    var index: Int = 0 {
        didSet {
            currentShape = shapes[index]
        }
    }

    // MARK: View Methods
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        shapes = [shapeCreator(bezierPath: UIBezierPath(homeIn: shapeView.bounds)),
                  shapeCreator(bezierPath: UIBezierPath(addIn: shapeView.bounds)),
                  shapeCreator(bezierPath: UIBezierPath(profileIn: shapeView.bounds)),
                  shapeCreator(bezierPath: UIBezierPath(searchIn: shapeView.bounds))]
        
        index = 0
    }
    
    // MARK: Helper Methods
    
    private func shapeCreator(bezierPath: UIBezierPath) -> CAShapeLayer {
        let shape = CAShapeLayer()
        shape.frame = bezierPath.bounds
        shape.path = bezierPath.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.red.cgColor
        shape.lineWidth = 2
        return shape
    }
    
    // MARK: Action Methods

    @IBAction func previous(_ sender: Any?) {
        if index == 0 {
            index = (shapes.count - 1)
        } else {
            index = index - 1
        }
    }
    
    @IBAction func next(_ sender: Any?) {
        if index == (shapes.count - 1) {
            index = 0
        } else {
            index = index + 1
        }
    }
}

