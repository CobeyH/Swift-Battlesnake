import App
import XCTest

@testable import App

final class AppTests: XCTestCase {
    
    func getTestData() -> App.Data {
        
        let game: Game = Game(id: "testingString")
         
        let snake1 = Snake(id: "mySnake", name: "mySnake", health: 92, body: [Point(x: 2, y: 1), Point(x: 1, y: 1), Point(x: 1, y: 2)])
         
         let board = Board(height: 5, width: 5, food: [Point(x: 0, y: 0), Point(x: 2, y: 4), Point(x: 4, y: 3)], snakes: [snake1])
         
         return Data(game: game, turn: 5, board: board, you: snake1)
    }

    
    
    func testDistanceBetween() throws {
        let p1 = Point(x: 1, y: 1)
        let p2 = Point(x: 3, y: 4)
        let p3 = Point(x: 2, y: 2)
        
        let d1 = p1.distance(to: p1)
        XCTAssert(d1 == 0, "Should be no distance between a point and itself")
        
        let d2 = p1.distance(to: p2)
        XCTAssert(d2 == 5)
        
        let d3 = p3.distance(to: p1)
        XCTAssert(d3 == 2)
    }
    
    func testFindSafeMove() throws {
        let testState = getTestData()
        let move = testState.you.find_safe_move(from: testState)
        
        XCTAssert(move == "down")
    }
    
    func testInBounds() throws {
        let data = getTestData()
        let invalidPoints = [Point(x: -1, y: 3), Point(x: 5, y: 2), Point(x: 0, y: 5)]
        let validPoints = [Point(x: 0, y: 0), Point(x: 4, y: 4), Point(x: 3, y: 2)]
        
        for p in invalidPoints {
            XCTAssertFalse(p.in_bounds(with: data))
        }
        for p in validPoints {
            XCTAssert(p.in_bounds(with: data))
        }
    }
    
    func testIsSafe() {
        let data = getTestData()
        let unsafePoints = [Point(x: -1, y: 3), Point(x: 2, y: 1), Point(x: 1, y: 2)]
        let safePoints = [Point(x: 0, y: 0), Point(x: 1, y: 3), Point(x: 3, y: 3)]
        
        for p in unsafePoints {
            XCTAssertFalse(p.is_safe(with: data))
        }
        for p in safePoints {
            XCTAssert(p.is_safe(with: data))
        }
    }
    
    func testOrthogonal() throws {
        
    }
    
    func testSuccessors() throws {
        let data = getTestData()
        let p1 = Point(x: 3, y: 3)
        let expectedResults: Set<Point> = [Point(x: 2, y: 3), Point(x: 3, y: 2), Point(x: 4, y: 3), Point(x: 3, y: 4)]
        let actualResults = p1.successors(from: data)
        
        XCTAssert(expectedResults == actualResults)
        
        let p2 = Point(x: 2, y: 2)
        let expectedResults2: Set<Point> = [Point(x: 3, y: 2), Point(x: 2, y: 3)]
        let actualResults2 = p2.successors(from: data)
        
        XCTAssert(expectedResults2 == actualResults2)
    }
    
    func testDirToPoint() throws {
        let snake = getTestData().board.snakes[0]
        let dir = snake.dir(to: Point(x: 1, y: 2))
        
        XCTAssert(dir == "left")
    
        let dir2 = snake.dir(to: Point(x: 2, y: 3))
        
        XCTAssert(dir2 == "down")
    }
    
    func testNearestFood() throws {
        let data = getTestData()
        let snake = data.board.snakes[0]
        
        let nearestFood = snake.nearestFood(from: data)
        
        XCTAssert(nearestFood == Point(x: 0, y: 0))
    }
    
    func testFloodFill() throws {
        let data = getTestData()
        let snake = data.board.snakes[0]
        
        let floodFill = snake.floodFill(from: data)
        
        XCTAssert(floodFill == 22)
    }
    
    func testSnakeById() throws {
        let data = getTestData()
        
        let snake = data.getSnake(by: "mySnake")
        
        XCTAssertNotNil(snake)
        
        let nullSnake = data.getSnake(by: "badID")
        
        XCTAssertNil(nullSnake)
    }
    
    func testIsFood() throws {
        let data = getTestData()
        
        let food1 = Point(x: 2, y: 4)
        
        XCTAssert(food1.isFood(from: data))
        
    }
}
