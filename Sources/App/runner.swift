//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-04.
//

import Foundation

func getNextMove(data: Data) -> [String: String] {
    print(data)
    let head = data.you.body[0]
    let dir = head.find_safe_move(for: data.you, from: data)
    return ["move": dir]

}
