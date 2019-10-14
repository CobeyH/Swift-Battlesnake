//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-04.
//

import Foundation

let profile: Profile = .AlphaBeta

func getNextMove(data: Data) -> [String: String] {
    switch profile {
        case .AStar:
            return AStar.getNextMove(from: data)
        case .AlphaBeta:
            return AlphaBeta.getNextMove(with: data)
        default:
            let dir = data.you.find_safe_move(from: data)
            print(data)
            return ["move": dir]
        
    }



}
