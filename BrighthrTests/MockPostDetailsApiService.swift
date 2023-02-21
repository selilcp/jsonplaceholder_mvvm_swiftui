//
//  MockPostDetailsApiService.swift
//  BrighthrTests
//
//  Created by selil on 18/01/23.
//

import Foundation
@testable import Brighthr

class MockPostDetailsApiService: PostDetailsService {

    
    var posts : Brighthr.Post
    var error: APIError?
    var savedStatus: Bool = false
    var savedCount: Int?
    
    init(posts: Brighthr.Post, error: APIError? = nil) {
        self.posts = posts
        self.error = error
    }
    
    func getPostDetails(postID: Int, completionHandler: @escaping (Brighthr.Post?, Brighthr.APIError?) -> ()) {
        completionHandler(posts,error)
    }
    
    func checkPostSaved(id: Int) -> Bool {
        savedStatus
    }
    
    func savePost(post: Brighthr.Post) -> Bool {
        savedStatus
    }
    
    func getSavedPostCount() -> Int {
        savedCount ?? 0
    }
}
