//
//  MovieManagerTests.swift
//  UnitTestTutTests
//
//  Created by Lucas Pereira on 29/07/22.
//

import XCTest

@testable import UnitTestTut

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!

    override func setUpWithError() throws {
        sut = MovieManager()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: Initial Values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSee, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        let testMovie = Movie(title: "The arrival")
        sut.addMovie(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSee, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        let testMovie = Movie(title: "Moana")
        sut.addMovie(movie: testMovie)
        
        let queriedMovie = sut.returnMovieAtIndex(index: 0)
        XCTAssertEqual(testMovie.title, queriedMovie.title)
    }
}
