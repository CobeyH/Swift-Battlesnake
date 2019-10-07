//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-05.
//

import Foundation
import AStar

class AStar {
    class func getNextMove(from data: Data) -> [String: String] {
        let head = data.you.body[0]
        let start = AStarPoint(x: head.x, y: head.y)
        let nearestFood = data.you.nearestFood(from: data)
        let end = AStarPoint(x: nearestFood.x, y: nearestFood.y)
        let path = start.findPath(to: end, with: data)
        let move: String
        if path.count > 1 {
            move = data.you.dir(to: path[1])
        } else {
            move = data.you.find_safe_move(from: data)
        }
        print(path)
        return ["move": move]
    }
}
