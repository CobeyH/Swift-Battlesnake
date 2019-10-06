//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-04.
//

import Foundation

let profile: Profile = .None

func getNextMove(data: Data) -> [String: String] {
    switch profile {
        case .AStar:
            return AStar.getNextMove(from: data)
        case .AlphaBeta:
            return AlphaBeta.getNextMove()
        default:
            let head = data.you.body[0]
            let dir = head.find_safe_move(for: data.you, from: data)
            print(data)
            return ["move": dir]
        
    }



}
