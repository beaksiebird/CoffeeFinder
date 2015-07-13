//
//  PrettyStar.swift
//  CoffeeFinder
//
//  Created by Whitney Lauren on 7/9/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

@IBDesignable class PrettyStar: UIButton{
    
    @IBInspectable var fillColor: UIColor = UIColor.darkGrayColor()
    @IBInspectable var strokeColor : UIColor = UIColor.blueColor()
    @IBInspectable var strokeWidth : CGFloat = 1
    
    var isStarSelected: Bool = false {
        
        didSet {
            
            setNeedsDisplay()
            
        }
        
    }
  
        
    let star = UIBezierPath()
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        
        star.moveToPoint(CGPointMake(112.79 - 54.6, 119.0))
        
        
        star.addCurveToPoint(CGPointMake(107.75 - 54.6, 122.6), controlPoint1: CGPointMake(113.41 - 54.6, 122.8), controlPoint2: CGPointMake(111.14 - 54.6, 124.42))
        
        star.addLineToPoint(CGPointMake(96.53 - 54.6, 116.58))
        
        star.addCurveToPoint(CGPointMake(84.14 - 54.6, 116.47), controlPoint1: CGPointMake(93.14 - 54.6, 114.76), controlPoint2: CGPointMake(87.56 - 54.6, 114.71))
        
        star.addLineToPoint(CGPointMake(72.82 - 54.6, 122.3))
        
        star.addCurveToPoint(CGPointMake(67.84 - 54.6, 118.62), controlPoint1: CGPointMake(69.4 - 54.6, 124.06), controlPoint2: CGPointMake(67.15 - 54.6, 122.41))
        
        star.addLineToPoint(CGPointMake(70.1 - 54.6, 106.09))
        
        star.addCurveToPoint(CGPointMake(66.37 - 54.6, 94.27), controlPoint1: CGPointMake(70.78 - 54.6, 102.3), controlPoint2: CGPointMake(69.1 - 54.6, 96.98))
        
        star.addLineToPoint(CGPointMake(57.33 - 54.6, 85.31))
        
        star.addCurveToPoint(CGPointMake(59.29 - 54.6, 79.43), controlPoint1: CGPointMake(54.6 - 54.6, 82.6), controlPoint2: CGPointMake(55.48 - 54.6, 79.95))
        
        star.addLineToPoint(CGPointMake(71.91 - 54.6, 77.71))
        
        star.addCurveToPoint(CGPointMake(81.99 - 54.6, 70.51), controlPoint1: CGPointMake(75.72 - 54.6, 77.19), controlPoint2: CGPointMake(80.26 - 54.6, 73.95))
        
        star.addLineToPoint(CGPointMake(87.72 - 54.6, 59.14))
        
        star.addCurveToPoint(CGPointMake(93.92 - 54.6, 59.2), controlPoint1: CGPointMake(89.46 - 54.6, 55.71), controlPoint2: CGPointMake(92.25 - 54.6, 55.73))
        
        star.addLineToPoint(CGPointMake(99.46 - 54.6, 70.66))
        
        star.addCurveToPoint(CGPointMake(109.42 - 54.6, 78.03), controlPoint1: CGPointMake(101.13 - 54.6, 74.13), controlPoint2: CGPointMake(105.62 - 54.6, 77.44))
        
        star.addLineToPoint(CGPointMake(122 - 54.6, 79.96))
        
        star.addCurveToPoint(CGPointMake(123.87 - 54.6, 85.87), controlPoint1: CGPointMake(125.81 - 54.6, 80.55), controlPoint2: CGPointMake(126.64 - 54.6, 83.21))
        
        star.addLineToPoint(CGPointMake(114.67 - 54.6, 94.68))
        
        star.addCurveToPoint(CGPointMake(110.75 - 54.6, 106.43), controlPoint1: CGPointMake(111.89 - 54.6, 97.34), controlPoint2: CGPointMake(110.13 - 54.6, 102.63))
        
        star.addLineToPoint(CGPointMake(112.79 - 54.6, 119))
        
        star.closePath()
        
    
        strokeColor.setStroke()
        star.lineWidth = strokeWidth
        fillColor.setFill()
//        star.fill()
//        star.stroke()
        
        CGContextSetLineWidth(context, strokeWidth)
        CGContextAddPath(context, star.CGPath)
        CGContextStrokePath(context)
        
        if isStarSelected {
            
            CGContextAddPath(context, star.CGPath)
            CGContextFillPath(context)
            
        }
        
        
    }
}

