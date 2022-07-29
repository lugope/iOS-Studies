//
//  MovieStructTest.swift
//  UnitTestTutTests
//
//  Created by Lucas Pereira on 29/07/22.
//

import XCTest

@testable import UnitTestTut

class MovieStructTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Zootopia", releaseDate: "1984")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1984")
    }
}
