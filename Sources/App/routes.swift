import Vapor
import SwiftyJSON

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Repsonse to /start request
    router.post("start") { req -> [String: String] in
        return ["":""]
    }
    
    // Response to /move requests
    router.post("move") { req -> [String: String] in
        let move = try req.content.decode(Data.self).map { data -> [String: String] in
            print(data)
            return ["move": "right"]
        }
        
        return move
    }
    
    router.post("ping") { req -> [String: String] in
        return ["move": "left"]
    }
    
    router.post("end") {req -> [String: String] in
        print("We Died")
        return ["move": "up"]
    
    }
}

// MARK: - Data
struct Data: Codable {
    let game: Game
    let turn: Int
    let board: Board
    let you: You
}

// MARK: - Board
struct Board: Codable {
    let height, width: Int
    let food: [Food]
    let snakes: [You]
}

// MARK: - Food
struct Food: Codable {
    let x, y: Int
}

// MARK: - You
struct You: Codable {
    let id, name: String
    let health: Int
    let body: [Food]
}

// MARK: - Game
struct Game: Codable {
    let id: String
}
