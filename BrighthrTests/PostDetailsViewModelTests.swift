//
//  PostDetailsViewModelTests.swift
//  BrighthrTests
//
//  Created by selil on 18/01/23.
//

import XCTest
@testable import Brighthr

final class PostDetailsViewModelTests: XCTestCase {
    
    func testSavePost() {
        let dummyPost = Post(userId: 0, id: 0, title: "", body: "")
        let service = MockPostDetailsApiService(posts: dummyPost)
        service.savedStatus = true
        let sut = PostDetailsViewModel(service: service)
        let expectation = XCTestExpectation(description: "expectation")
        sut.fetchPostDetails(postID: 0) { error in
            RunLoop.main.perform {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 2.0)
        sut.savePost()
        XCTAssertEqual(sut.postSaved, true)
        
    }
}
