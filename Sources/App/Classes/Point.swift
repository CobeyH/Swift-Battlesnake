//
//  Point.swift
//  App
//
//  Created by Cobey Hollier on 2019-10-03.
//

import Foundation

final class Point: Codable {
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func log() {
        print("(\(self.x), \(self.y))")
    }
    
    func find_safe_move(for snake: Snake, from data: Data) -> String {
        if Point(x: self.x + 1, y:self.y).is_safe(for: snake, with: data) {
            print("going right")
            return "right"
        } else if Point(x: self.x, y: self.y + 1).is_safe(for: snake, with: data) {
            return "down"
        } else if Point(x: self.x, y: self.y - 1).is_safe(for: snake, with: data) {
            return "up"
        }
        return "left"
    }
    
    func in_bounds(with data: Data) -> Bool {
          let width = data.board.width
          let height = data.board.height
          
          if(self.x >= width || self.x < 0) { return false}
          if(self.y >= height || self.y < 0) { return false }
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
    
    func orthogonal() -> [Point] {
        let orth = [
            Point(x: self.x - 1, y: self.y),
            Point(x: self.x + 1, y: self.y),
            Point(x: self.x, y: self.y + 1),
            Point(x: self.x, y: self.y - 1)
        ]
        return orth
    }
}
