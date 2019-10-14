import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Repsonse to /start request
    router.post("start") { req -> [String: String] in
        return ["color":"#00BEC1"]
    }
    
    // Response to /move requests
    router.post("move") { req -> Future<[String: String]> in
        let move = try req.content.decode(Data.self).map { data -> [String: String] in
            
            return getNextMove(data: data)
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
