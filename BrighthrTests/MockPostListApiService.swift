//
//  MockPostListApiService.swift
//  BrighthrTests
//
//  Created by selil on 17/01/23.
//

import Foundation
@testable import Brighthr

class MockPostListService: PostListService {
    var posts : [Brighthr.Post]
    var error: APIError?
    
    init(posts: [Brighthr.Post] = [], error: APIError? = nil) {
        self.posts = posts
        self.error = error
    }
    
    func getPosts(completionHandler: @escaping ([Brighthr.Post]?, Brighthr.APIError?) -> ()) {
        completionHandler(posts,error)
    }
}
