import Foundation

// MARK: - Data
struct Data: Codable, CustomStringConvertible {
    let game: Game
    let turn: Int
    var board: Board
    var you: Snake
    
    var description: String {
        "============================== \n Board State for turn \(turn)\n Size: \(board.width) x \(board.height) \n Our Snake: Health \(you.health) Body: \(you.body) \n Long Data\n ---------- \n All Snake: \(board.snakes) \n All Food: \(board.food)"
    }
    
    func getSnake(by id: String) -> Snake? {
        for snake in board.snakes {
            if(id == snake.id) {
                return snake
            }
        }
        return nil
    }
    
    func update(snake: inout Snake, from point: Point) {
        let collected = point.isFood(from: self)

        snake.body.insert(point, at: 0)
        let _ = snake.body.popLast()

        if(collected) {
            snake.health = 100
            let tail = snake.body.last
            if let tail = tail {
                snake.body.append(tail)
            }
        } else {
            snake.health = snake.health - 1
        }
    }
}

// MARK: - Board
struct Board: Codable {
    let height, width: Int
    var food: [Point]
    var snakes: [Snake]
}

// MARK: - Game
struct Game: Codable {
    let id: String
}

// MARK: - Dir
enum Dir {
    case Left
    case Up
    case Right
    case Down
}
