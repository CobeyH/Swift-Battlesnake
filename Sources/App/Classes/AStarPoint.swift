//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-05.
//

import Foundation
import AStar

final class AStarPoint: Point, GraphNode {
    
    var connectedNodes: Set<AStarPoint>

    init(x: Int, y: Int, snake: Snake, data: Data) {
        connectedNodes = Set<AStarPoint>()
        super.init(x: x, y: y)
        let tempnodes = successors(with: data)
               for node in tempnodes {
                connectedNodes.insert(AStarPoint(x: node.x, y: node.y, snake: snake, data: data))
               }
    }
    
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    // Mark - AStar Methods
    
    public func estimatedCost(to node: AStarPoint) -> Float {
        return Float(distance(to: node))
    }
    
    public func cost(to node: AStarPoint) -> Float {
        return Float(distance(to: node))
    }
}
