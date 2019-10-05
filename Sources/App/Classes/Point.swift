//
//  Point.swift
//  App
//
//  Created by Cobey Hollier on 2019-10-03.
//

import Foundation
import AStar



final class Point: CustomStringConvertible, GraphNode, Codable, Hashable {
    
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        connectedNodes = []
    }
    
    public var connectedNodes: Set<Point>
    
     func setConnectedNodes(for snake: Snake, with data: Data) {
        connectedNodes = successors(for: snake, with: data)
    }
    
    func find_safe_move(for snake: Snake, from data: Data) -> String {
        if Point(x: self.x, y: self.y + 1).is_safe(for: snake, with: data) {
            return "down"
        } else if Point(x: self.x, y: self.y - 1).is_safe(for: snake, with: data) {
            return "up"
        }
        return "left"
    }
    
    func in_bounds(with data: Data) -> Bool {
          let width = data.board.width
          let height = data.board.height
          
        if(self.x >= width || self.x < 0) { return false }
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
    
    func successors(for snake: Snake, with data: Data) ->  Set<Point>{
        var successors: Set<Point> = []
        for p in self.orthogonal() {
            if p.is_safe(for: snake, with: data) {
                successors.insert(p)
            }
        }
        return successors
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
        return 1
    }
}
