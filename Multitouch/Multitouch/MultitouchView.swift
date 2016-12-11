//
//  MultitouchView.swift
//  Multitouch
//
//  Created by Daniel Clelland on 11/12/16.
//  Copyright © 2016 Daniel Clelland. All rights reserved.
//

import UIKit
import MultitouchGestureRecognizer

@IBDesignable class MultitouchView: UIView {
    
    private let touchRadius: CGFloat = 44.0
    
    private var multitouchGestureRecognizer: MultitouchGestureRecognizer? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: Actions
    
    func draw(multitouchGestureRecognizer: MultitouchGestureRecognizer) {
        self.multitouchGestureRecognizer = multitouchGestureRecognizer
    }
    
    func clear() {
        self.multitouchGestureRecognizer = nil
    }
    
    // MARK: Overrides
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(UIColor.darkGray.cgColor)
            context.fill(rect)
            
            if let multitouchGestureRecognizer = multitouchGestureRecognizer {
                draw(multitouchGestureRecognizer: multitouchGestureRecognizer, in: context)
            }
        }
        
        super.draw(rect)
    }
    
    // MARK: Drawing
    
    private func draw(multitouchGestureRecognizer: MultitouchGestureRecognizer, in context: CGContext) {
        for (index, touch) in multitouchGestureRecognizer.touches.enumerated() {
            draw(touch: touch, at: index, in: context)
        }
    }
    
    private func draw(touch: UITouch, at index: Int, in context: CGContext) {
        context.setFillColor(color(for: index).cgColor)
        context.addPath(CGPath(ellipseIn: rect(for: touch), transform: nil))
        context.fillPath()
    }
    
    private func rect(for touch: UITouch) -> CGRect {
        let location = touch.location(in: self)
        return CGRect(
            x: location.x - touchRadius,
            y: location.y - touchRadius,
            width: touchRadius * 2.0,
            height: touchRadius * 2.0
        )
    }
    
    private func color(for index: Int) -> UIColor {
        return UIColor(hue: CGFloat(index) / 10.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
}
