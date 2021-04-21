//
//  Canvas.swift
//  DrawingProject
//
//  Created by Melanie Chavez on 3/18/21.
//

import Foundation
import UIKit

class Canvas: UIView {
    
    fileprivate var strokeColor = UIColor.black
    
    var stopLines = [[CGPoint]]()
    
    func setStrokeColor(color: UIColor){
        //set color to color that you call this function with 
        self.strokeColor = color
    }
    
    func newCanvas(){
        stopLines.removeAll()
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        //custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        
        //everything is meant to be in context of Core Graphics (CG)
        context.setStrokeColor(strokeColor.cgColor)
        context.setLineWidth(5)
        context.setLineCap(.round)
        
        stopLines.forEach { (line) in
            //i is index
            //p is point in line
            for(i, p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
        }
        
//        //i is index
//        //p is point in line
//        for(i, p) in line.enumerated(){
//            if i == 0{
//                context.move(to: p)
//            } else {
//                context.addLine(to: p)
//            }
//        }
        
        context.strokePath()
    }
    
    //draw line based on touch:
    //var line = [CGPoint]()
    
    //var stopLines = [[CGPoint]]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stopLines.append([CGPoint]())
    }
    
    //track the users finger move across the screen:
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else {return}
        
        guard var lastline = stopLines.popLast() else {return}
        lastline.append(point)
        stopLines.append(lastline)
        
        //prints where the user is touching the screen
        //print(point)
        
        //line.append(point)
        
        //redraw:
        setNeedsDisplay()
    }
}
