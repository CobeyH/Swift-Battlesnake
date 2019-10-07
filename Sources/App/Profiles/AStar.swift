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
        let path = start.findPath(to: AStarPoint(x: 0, y: 0), with: data)
        print(path)
        return ["move": "down"]
    }
}
