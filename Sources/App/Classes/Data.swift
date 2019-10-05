// MARK: - Data
struct Data: Codable {
    let game: Game
    let turn: Int
    let board: Board
    let you: Snake
}

// MARK: - Board
struct Board: Codable {
    let height, width: Int
    let food: [Point]
    let snakes: [Snake]
    
}

// MARK: - You
struct Snake: Codable {
    let id, name: String
    let health: Int
    let body: [Point]
}

// MARK: - Game
struct Game: Codable {
    let id: String
}
