//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-05.
//

import Foundation
import AStar

final class AStarPoint: Point, GraphNode {
    
    func getConnectedNodes(from data: Data) -> Set<AStarPoint> {
        var connectedNodes: Set<AStarPoint> = []
        for point in successors(with: data) {
            connectedNodes.insert(AStarPoint(x: point.x, y: point.y))
        }
        return connectedNodes
    }
    
    
    // Mark - AStar Methods
    
    public func estimatedCost(to node: AStarPoint) -> Float {
        return Float(distance(to: node))
    }
    
    public func cost(to node: AStarPoint) -> Float {
        return Float(distance(to: node))
    }
}
