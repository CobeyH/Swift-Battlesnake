//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-05.
//

import Foundation

class AlphaBeta {

    
    class func getNextMove(with data: Data) -> [String: String] {
        let MIN = -1000000
        let MAX =  1000000
        let myId = data.you.id
        var enemyId = "temp"
        for snake in data.board.snakes {
            if(snake.id != myId) {
                enemyId = snake.id
            }
        }
        let (score, bestMove) = AlphaBeta.minimax(with: data, max_player: true, enemyId: enemyId, myId: myId, depth: 1, alpha: MIN, beta: MAX)
        print(score, bestMove)
        let bestDir = score > MIN ? data.you.dir(to: bestMove) : data.you.find_safe_move(from: data)
        return ["move": bestDir]
    }
    
    class func minimax(with data: Data, max_player: Bool, enemyId: String, myId: String, depth: Int, alpha: Int, beta: Int) -> (Int, Point) {
        let mySnake = data.getSnake(by: myId)
        let enemySnake = data.getSnake(by: enemyId)
        if(depth > 4) {
            return (2 * finalScore(for: mySnake!, from: data) - finalScore(for: enemySnake!, from: data), Point(x: 0, y: 0))
        }
        
        var (temp_snake, best_score) = max_player ? (data.getSnake(by: myId), -1000000) : (data.getSnake(by: enemyId), 1000000)
        var best_move = Point(x: 0, y: 0)
        var successors = temp_snake!.body[0].successors(from: data)
        //Add our head as a possible move for the enemy
        if(!max_player) {
            let ourHead = data.getSnake(by: myId)!.body[0]
            for point in temp_snake!.body[0].orthogonal() {
                if(point == ourHead) {
                    successors.insert(ourHead)
                }
            }
        }
        
        for pos_move in successors {
            var new_st = data
            
            if(max_player) {
                let index = new_st.index(of: myId)!
                new_st.update(snake: &(new_st.board.snakes[index]), from: pos_move)
                if(new_st.board.snakes[index].health == 0) {
                    continue
                }
                let (val, _) = minimax(with: new_st, max_player: false, enemyId: enemyId, myId: myId, depth: depth + 1, alpha: alpha, beta: beta)
                if(val > best_score) {
                    best_move = pos_move
                }
                best_score = max(val, best_score)
                let new_alpha = max(alpha, best_score)
                
                if(beta <= new_alpha) {
                    break
                }
            } else {
                let index = new_st.index(of: enemyId)!
                new_st.update(snake: &(new_st.board.snakes[index]), from: pos_move)
                // Handle head on condition
                let our_snake = new_st.getSnake(by: myId)!
                if(our_snake.body[0] == pos_move) {
                    if(our_snake.body.count > new_st.board.snakes[index].body.count) {
                        continue
                    } else {
                        return (-1000000, best_move)
                    }
                }
                
                let (val, _) = minimax(with: new_st, max_player: true, enemyId: enemyId, myId: myId, depth: depth + 1, alpha: alpha, beta: beta)
                
                if val < best_score {
                    best_move = pos_move
                }
                best_score = min(best_score, val)
                let new_beta = min(best_score, beta)
                
                if(new_beta < alpha) {
                    break
                }
            }
        }
        return (best_score, best_move)
    }
    
    class func finalScore(for snake: Snake, from data: Data) -> Int {
        return snake.floodFill(from: data)
    }
}
