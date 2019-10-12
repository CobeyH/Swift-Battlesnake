//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-05.
//

import Foundation

class AlphaBeta {
    let maxDepth = 8
    
    class func getNextMove() -> [String: String] {
        return ["move": "down"]
    }
    
    func minimax(data: Data, max_player: Bool, enemyId: String, myID: String, depth: Int, alpha: Int, beta: Int) -> (Int, Point) {
        let mySnake = data.getSnake(by: myID)
        let enemySnake = data.getSnake(by: enemyId)
        if(depth > maxDepth) {
            return (2 * (finalScore(for: mySnake!, from: data) - finalScore(for: enemySnake!, from: data)), Point(x: 0, y: 0))
        }
        
        return (1, Point(x: 0, y: 0))
    }
    
    func finalScore(for snake: Snake, from data: Data) -> Int {
        return snake.floodFill(from: data)
    }
}
