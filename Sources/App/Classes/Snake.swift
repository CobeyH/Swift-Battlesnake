//
//  File.swift
//  
//
//  Created by Cobey Hollier on 2019-10-05.
//

import Foundation


// MARK: - Snake
struct Snake: Codable, CustomStringConvertible {
    let id, name: String
    let health: Int
    let body: [Point]
    
    var description: String {
        "Name: \(name) Health: \(health) \n Body: \(body)\n"
    }
    
    func find_safe_move(from data: Data) -> String {
        let head = body[0]
        if Point(x: head.x, y: head.y + 1).is_safe(with: data) {
            return "down"
        } else if Point(x: head.x, y: head.y - 1).is_safe( with: data) {
            return "up"
        } else if Point(x: head.x + 1, y: head.y).is_safe(with: data) {
            return "right"
        }
        return "left"
    }

}
