//
//  BrighthrTests.swift
//  BrighthrTests
//
//  Created by selil on 16/01/23.
//

import XCTest
@testable import Brighthr

final class PostListViewModelTests: XCTestCase {

    func testPostFetchingWhenInternalServerError() {
        let service = MockPostListService(error:APIError(httpStatusCode: HttpError.internalServerError.rawValue, message: nil) )
        let sut = PostListViewModel(service: service)
        
        sut.fetchPosts { error in
            XCTAssertEqual(error?.httpError, HttpError.internalServerError)
        }
    }
    
    func testNumberOfPostCount() {
        let dummyPost = Post(userId: 0, id: 0, title: "", body: "")
        let service = MockPostListService(posts: [dummyPost] )
        let sut = PostListViewModel(service: service)
        
        let expectation = XCTestExpectation(description: "expectation")
        sut.fetchPosts { error in
            RunLoop.main.perform {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(sut.posts.count, 1)
    }
    
    func testAllPostDetails() {
        let dummyPost = Post(userId: 0, id: 1, title: "title", body: "body")
        let service = MockPostListService(posts: [dummyPost] )
        let sut = PostListViewModel(service: service)
        
        let expectation = XCTestExpectation(description: "expectation")
        sut.fetchPosts { error in
            RunLoop.main.perform {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(sut.posts[0].id, 1)
        XCTAssertEqual(sut.posts[0].userId, 0)
        XCTAssertEqual(sut.posts[0].title, "title")
        XCTAssertEqual(sut.posts[0].body, "body")
    }

}
