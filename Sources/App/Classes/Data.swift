import Foundation

// MARK: - Data
struct Data: Codable, CustomStringConvertible {
    let game: Game
    let turn: Int
    let board: Board
    let you: Snake
    
    var description: String {
        "============================== \n Board State for turn \(turn)\n Size: \(board.width) x \(board.height) \n Our Snake: Health \(you.health) Body: \(you.body) \n Long Data\n ---------- \n All Snake: \(board.snakes) \n All Food: \(board.food)"
    }
}

// MARK: - Board
struct Board: Codable {
    let height, width: Int
    let food: [Point]
    let snakes: [Snake]
    
}

// MARK: - Snake
struct Snake: Codable, CustomStringConvertible {
    let id, name: String
    let health: Int
    let body: [Point]
    
    var description: String {
        "Name: \(name) Health: \(health) \n Body: \(body)\n"
    }
}

// MARK: - Game
struct Game: Codable {
    let id: String
}
