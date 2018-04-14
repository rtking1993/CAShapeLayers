// MARK: Frameworks

import UIKit

// MARK: UIBezierPath Methods

extension UIBezierPath {
    convenience init(homeIn rect: CGRect) {
        self.init()
        
        let roofHeight: CGFloat = rect.height * 0.55
        let roofIndent: CGFloat = rect.width * 0.15
        let doorHeight: CGFloat = rect.height * 0.3
        let doorWidth: CGFloat = rect.width * 0.06
        
        move(to: CGPoint(x: rect.width * 0.5, y: lineWidth))
        addLine(to: CGPoint(x: rect.width - lineWidth, y: roofHeight))
        addLine(to: CGPoint(x: rect.width - lineWidth - roofIndent, y: roofHeight))
        addLine(to: CGPoint(x: rect.width - lineWidth - roofIndent, y: rect.height - lineWidth))
        addLine(to: CGPoint(x: (rect.width * 0.5) + doorWidth, y: rect.height - lineWidth))
        addLine(to: CGPoint(x: (rect.width * 0.5) + doorWidth, y: rect.height - doorHeight))
        addLine(to: CGPoint(x: (rect.width * 0.5) - lineWidth - doorWidth, y: rect.height - doorHeight))
        addLine(to: CGPoint(x: (rect.width * 0.5) - lineWidth - doorWidth, y: rect.height - lineWidth))
        addLine(to: CGPoint(x: roofIndent, y: rect.height - lineWidth))
        addLine(to: CGPoint(x: roofIndent, y: roofHeight))
        addLine(to: CGPoint(x: lineWidth, y: roofHeight))
        close()
    }
    
    convenience init(searchIn rect: CGRect) {
        self.init()
        
        let circleRadius: CGFloat = rect.width * 0.35
        
        addArc(withCenter: CGPoint(x: circleRadius + lineWidth, y: circleRadius + lineWidth),
               radius: circleRadius,
               startAngle: 0,
               endAngle: radians(from: 360),
               clockwise: true)
        move(to: CGPoint(x: 2*(circleRadius - lineWidth), y: 2*(circleRadius - lineWidth)))
        addLine(to: CGPoint(x: rect.width, y: rect.height))
        close()
    }
    
    convenience init(addIn rect: CGRect) {
        self.init()
        
        move(to: CGPoint(x: rect.width * 0.5, y: 0))
        addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height))
        
        move(to: CGPoint(x: 0, y: rect.height * 0.5))
        addLine(to: CGPoint(x: rect.width, y: rect.height * 0.5))
        close()
    }
    
    convenience init(profileIn rect: CGRect) {
        self.init()
        
        let smallCircleRadius: CGFloat = rect.width * 0.25
        let largeCircleRadius: CGFloat = rect.width * 0.5
        
        addArc(withCenter: CGPoint(x: rect.width * 0.5, y: smallCircleRadius + lineWidth),
               radius: smallCircleRadius,
               startAngle: 0,
               endAngle: radians(from: 360),
               clockwise: true)
        move(to: CGPoint(x: 0, y: rect.height))
        addArc(withCenter: CGPoint(x: rect.width * 0.5, y: rect.height),
               radius: largeCircleRadius - 2*lineWidth,
               startAngle: radians(from: 180),
               endAngle: radians(from: 0),
               clockwise: true)
        move(to: CGPoint(x: rect.width, y: rect.height))
        close()
    }
}
