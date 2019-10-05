//
//  Point.swift
//  App
//
//  Created by Cobey Hollier on 2019-10-03.
//

import Foundation

extension CGPoint: CustomStringConvertible {
    
    func find_safe_move(for snake: Snake, from data: Data) -> String {
        if CGPoint(x: self.x + 1, y:self.y).is_safe(for: snake, with: data) {
            return "right"
        } else if CGPoint(x: self.x, y: self.y + 1).is_safe(for: snake, with: data) {
            return "down"
        } else if CGPoint(x: self.x, y: self.y - 1).is_safe(for: snake, with: data) {
            return "up"
        }
        return "left"
    }
    
    func in_bounds(with data: Data) -> Bool {
          let width = data.board.width
          let height = data.board.height
          
        if(Int(self.x) >= width || Int(self.x) < 0) { return false }
          if(Int(self.y) >= height || Int(self.y) < 0) { return false }
          return true
      }
    
    func is_safe(for me: Snake, with data: Data) -> Bool {
        if !in_bounds(with: data){ return false }
        for snake in data.board.snakes {
            if(snake.id == me.id && self == snake.body[0]) {
                return me.body.count > snake.body.count
            }
            for point in snake.body {
                if point.x == self.x && point.y == self.y {
                    return false
                }
            }
        }
        return true
    }
    
    func orthogonal() -> [CGPoint] {
        let orth = [
            CGPoint(x: self.x - 1, y: self.y),
            CGPoint(x: self.x + 1, y: self.y),
            CGPoint(x: self.x, y: self.y + 1),
            CGPoint(x: self.x, y: self.y - 1)
        ]
        return orth
    }
    
    static func == (point1: CGPoint, point2: CGPoint) -> Bool {
        return (point1.x == point2.x && point1.y == point2.y)
    }
    
    public var description : String {
        "(\(self.x), \(self.y))"
    }
}
