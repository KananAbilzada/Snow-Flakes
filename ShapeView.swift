//
//  ShapeView.swift
//  Snow with Core Animation
//
//  Created by Kanan Abilzada on 17.01.22.
//

import UIKit

class ShapeView: UIView {
    var strokeWidth: CGFloat = 2.0
    var strokeColor: UIColor = UIColor.black
    var fillColor: UIColor = UIColor.white
    var path: UIBezierPath?

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    override func layoutSubviews() {
        let layer = self.layer as! CAShapeLayer

        guard let pathCopy = path?.copy() as? UIBezierPath else { return }

        pathCopy.apply(CGAffineTransform(scaleX: bounds.width, y: bounds.height))

        layer.strokeColor = strokeColor.cgColor
        layer.fillColor = fillColor.cgColor
        layer.lineWidth = strokeWidth
        layer.shadowColor = strokeColor.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1

        // convert the UIBezierPath to a CGPath and use it for the shape path
        layer.path = pathCopy.cgPath
    }

}
