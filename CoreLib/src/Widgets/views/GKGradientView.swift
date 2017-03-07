//
//  GKGradientView.swift
//  CoreLib
//
//  Created by Jonathan Unsworth on 2017/03/02.
//  Copyright © 2017 Jonathan Unsworth. All rights reserved.
//

import UIKit

@IBDesignable public class GKGradientView: UIView {
    
    // MARK: Variables
    @IBInspectable var c1: UIColor = UIColor(red: 65/255, green: 150/255, blue: 255/255, alpha: 1) {
        didSet {
            
        }
    }
    
    @IBInspectable var c2: UIColor = UIColor(red: 0/255, green: 0/255, blue: 239/255, alpha: 1) {
        didSet {
            
        }
    }
    
    // MARK: Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience public init (frame: CGRect, startColor: UIColor, endColor: UIColor) {
        self.init(frame: frame)
        self.c1 = startColor
        self.c2 = endColor
    }
    
    override public func draw(_ rect: CGRect) {
        // 1
        guard let currentContext = UIGraphicsGetCurrentContext() else { return }
        
        // 2
        currentContext.saveGState()
        
        // 3
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4
        let startColor = self.c1
        guard let startColorComponents = startColor.cgColor.components else { return }
        
        let endColor = self.c2
        guard let endColorComponents = endColor.cgColor.components else { return }
        
        // 5
        let colorComponents: [CGFloat]
            = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        // 6
        let locations:[CGFloat] = [0.0, 1.0]
        
        // 7
        guard let gradient = CGGradient(colorSpace: colorSpace,colorComponents: colorComponents,locations: locations,count: 2) else { return }
        
        let startPoint = CGPoint(x: 0, y: self.bounds.height)
        let endPoint = CGPoint(x: self.bounds.width,y: self.bounds.height)
        
        // 8
        currentContext.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
        
        // 9
        currentContext.restoreGState()
    }
    
}

