//
//  YZFloatAnimationView.swift
//  YZFloatAnimationDemo
//
//  Created by heyuze on 16/8/5.
//  Copyright © 2016年 heyuze. All rights reserved.
//

import UIKit


class YZFloatAnimationView: UIView {
    
    private var image: UIImage
    private var floatView: UIImageView = UIImageView()
    
    
    // MARK: - init
    
    init(image: UIImage) {
        self.image = image
        super.init(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Set up
    
    private func setupUI() {
        backgroundColor = UIColor.clear
        
        floatView.frame = self.frame
        floatView.image = self.image
        self.addSubview(floatView)
    }
    
    
    // MARK: - Func
    
    func animating(in view: UIView) {
        let PI = Double.pi
        let totalAnimationDuration:TimeInterval = 6
        let heartSize = frame.width
        let heartCenterX = center.x
        let viewHeight = view.bounds.height
        
        //Pre-Animation setup
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.alpha = 0
        
        //Bloom
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity
            self.alpha = 0.9
        }, completion: nil)
    
        let i = CGFloat(arc4random_uniform(2))
        let rotationDirection = CGFloat(1 - (2 * i))
        let rotationFraction  = CGFloat(arc4random_uniform(10))
        UIView.animate(withDuration: totalAnimationDuration, animations: { 
            self.transform = CGAffineTransform(rotationAngle: rotationDirection * CGFloat(PI) / (16 + rotationFraction * 0.2))
        }) 
        
        let heartTravelPath = UIBezierPath()
        heartTravelPath.move(to: center)
        
        //random end point
        let endPoint = CGPoint(x: heartCenterX + (rotationDirection) * CGFloat(arc4random_uniform(2*UInt32(heartSize))), y: viewHeight/6.0 + CGFloat(arc4random_uniform(UInt32(viewHeight)/UInt32(4))))  // 6.0->3.0    4->2
        
        //random Control Points
        let j = NSInteger(arc4random_uniform(2))
        let travelDirection = NSInteger(1 - (2*j)) // -1 OR 1
        
        //randomize x and y for control points
        let xDelta = (heartSize/2.0 + CGFloat(arc4random_uniform(2*UInt32(heartSize)))) * CGFloat(travelDirection)
        let yDelta = max(endPoint.y, max(CGFloat(arc4random_uniform(8*UInt32(heartSize))), heartSize))
        let controlPoint1 = CGPoint(x: heartCenterX+xDelta, y: viewHeight - yDelta)
        let controlPoint2 = CGPoint(x: heartCenterX - 2*xDelta, y: yDelta)
        
        heartTravelPath.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnimation.path = heartTravelPath.cgPath
        keyFrameAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        keyFrameAnimation.duration = totalAnimationDuration + Double(endPoint.y)/Double(viewHeight)
        self.layer.add(keyFrameAnimation, forKey: "positionOnPath")
        
        //Alpha & remove from superview
        UIView.animate(withDuration: totalAnimationDuration, animations: { 
            self.alpha = 0
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
    
}
