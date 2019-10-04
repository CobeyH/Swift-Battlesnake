import Vapor

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
        let test = ["move": "left"]
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
