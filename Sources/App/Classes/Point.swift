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
    
    func find_safe_move(from data: Data) -> String {
        if Point(x: self.x + 1, y:self.y).is_safe(with: data) {
            print("going right")
            return "right"
        } else if Point(x: self.x, y: self.y + 1).is_safe(with: data) {
            return "down"
        } else if Point(x: self.x, y: self.y - 1).is_safe(with: data) {
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
    
    func is_safe(with data: Data) -> Bool {
        if !in_bounds(with: data){ return false }
        
        for snake in data.board.snakes {
            for point in snake.body {
                if point.x == self.x && point.y == self.y {
                    return false
                }
            }
        }
        return true
    }
    
}
