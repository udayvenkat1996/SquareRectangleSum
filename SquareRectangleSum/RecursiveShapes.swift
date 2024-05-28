//
//  RecursiveShapes.swift
//  SquareRectangleSum
//
//  Created by Uday Venkat on 27/05/24.
//

import SwiftUI

struct RecursiveShape: Shape {
    var level: Int
    var totalLevels: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        drawShapes(in: rect, level: level, totalLevels: totalLevels, path: &path)
        return path
    }
    
    private func drawShapes(in rect: CGRect, level: Int, totalLevels: Int, path: inout Path) {
        guard level < totalLevels else { return }
        
        let size = min(rect.width, rect.height)
        
        if level % 2 == 0 {
            // Draw equilateral triangle
            let height = size
            let midX = rect.midX
            path.move(to: CGPoint(x: midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.closeSubpath()
            
            // Next level
            let newRect = CGRect(x: rect.midX - size / 4, y: rect.maxY - height / 2, width: size / 2, height: height / 2)
            drawShapes(in: newRect, level: level + 1, totalLevels: totalLevels, path: &path)
        } else {
            // Draw square
            let halfSize = size
            let newRect = CGRect(x: rect.midX - halfSize / 2, y: rect.midY - halfSize / 2, width: halfSize, height: halfSize)
            path.addRect(newRect)
            
            // Next level
            drawShapes(in: newRect, level: level + 1, totalLevels: totalLevels, path: &path)
        }
    }
}
