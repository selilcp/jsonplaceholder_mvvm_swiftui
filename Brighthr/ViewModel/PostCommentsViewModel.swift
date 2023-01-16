//
//  PostCommentsViewModel.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

class PostCommentsViewModel : ObservableObject {
    
    @Published var post: PostComments?
    var service: CommentListService
    
    init (service: CommentListService) {
        self.service = service
    }
    
    func fetchPostDetails(postID:Int,complitionHandler: @escaping (APIError?) -> () ){
        service.getPostComments (postID: postID)
        { [weak self] (content, error) in
            RunLoop.main.perform {
                self?.post = content
            }
            complitionHandler(error)
        }
    }
}
