//
//  CommentListService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

protocol CommentListService {
    func getPostComments(postID:Int, completionHandler: @escaping ([PostComment]?, APIError?) -> ())
}

class DefaultCommentListService: CommentListService{
    func getPostComments(postID:Int, completionHandler: @escaping ([PostComment]?, APIError?) -> ()) {
        let handler = GetPostCommentsHandler()
        let apiLoader = APILoader( apiHandler: handler)
        
        apiLoader.loadAPIRequest(urlParam: ["postID":"\(postID)"],
                                 queryParam: nil,
                                 bodyParam: nil)
        { content, error in
            completionHandler(content ,error)
        }
    }
}
