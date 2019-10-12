//
//  Point.swift
//  App
//
//  Created by Cobey Hollier on 2019-10-03.
//

import Foundation
import AStar



final class Point: CustomStringConvertible, Codable, Hashable, GraphNode {
    
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    
    func in_bounds(with data: Data) -> Bool {
          let width = data.board.width
          let height = data.board.height
          
        if(x >= width || x < 0) { return false }
          if(y >= height || y < 0) { return false }
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
    
    func orthogonal() -> [Point] {
        let orth = [
            Point(x: self.x - 1, y: self.y),
            Point(x: self.x + 1, y: self.y),
            Point(x: self.x, y: self.y + 1),
            Point(x: self.x, y: self.y - 1)
        ]
        return orth
    }
    
    func distance(to point: Point) -> Int {
        return abs(self.x - point.x) + abs(self.y - point.y)
    }
    
    func successors(from data: Data) ->  Set<Point>{
        var successors: Set<Point> = []
        for p in self.orthogonal() {
            if p.is_safe(with: data) {
                successors.insert(p)
            }
        }
        return successors
    }
    
    
    func isFood(from data: Data) -> Bool {
        if data.board.food.contains(self) {
            return true
        }
        return false
    }
    
    static func == (point1: Point, point2: Point) -> Bool {
        return (point1.x == point2.x && point1.y == point2.y)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
    public var description : String {
        "(\(self.x), \(self.y))"
    }
    
    
    // Mark - AStar Methods
    
    public func estimatedCost(to node: Point) -> Float {
        return Float(distance(to: node))
    }
    
    public func cost(to node: Point) -> Float {
        return Float(distance(to: node))
    }
    

}
