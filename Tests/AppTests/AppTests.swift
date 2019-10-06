import App
import XCTest

@testable import App

final class AppTests: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        
        let testState = Data()
        testState.
        
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
}
