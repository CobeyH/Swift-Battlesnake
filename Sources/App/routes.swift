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
        print(req)
        let test = ["move": "left"]
        let json = req.content
        return test
    }
    
    router.post("ping") { req -> [String: String] in
        return ["move": "left"]
    }
    
    router.post("end") {req -> [String: String] in
        print("We Died")
        return ["move": "up"]
    
    }
}

struct Data: Content {
    let game: Game
    let turn: Int
    let board: Board
}

struct Game: Content {
    let id: String
}

struct Board: Content {
    let food: [Point]
    let snakes: [Snake]
    let you: Snake
}

struct Snake: Content {
    let id: String
    let name: String
    let health: Int
    let body: [Point]
}