//
//  PostListViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostListViewModel : ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var users: [User] = []
    var service: PostListService
    
    init (service: PostListService) {
        self.service = service
    }
    
    func fetchUsersList(complitionHandler: @escaping (APIError?) -> () ){
        service.getUsers { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.users = content ?? []
            }
            complitionHandler(error)
        }
    }
    
    func fetchPosts(complitionHandler: @escaping (APIError?) -> () ){
        service.getPosts { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.posts = content ?? []
            }
            complitionHandler(error)
        }
    }
}
