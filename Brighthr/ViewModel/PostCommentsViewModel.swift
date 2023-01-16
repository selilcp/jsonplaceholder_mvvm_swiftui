//
//  PostCommentsViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostCommentsViewModel : ObservableObject {
    
    @Published var post: [SavedPost] = []
    var service: SavedPostService
    
    init (service: SavedPostService) {
        self.service = service
    }
    
    func fetchPostList(complitionHandler: @escaping (Error?) -> () ){
        service.getSavedPosts
        { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.post = content ?? []
            }
            complitionHandler(error)
        }
    }
}
