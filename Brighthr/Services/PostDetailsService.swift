//
//  PostDetailsService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import Foundation

protocol PostDetailsService {
    func getPostDetails(postID:Int, completionHandler: @escaping (Post?, APIError?) -> ())
    func checkPostSaved(id:Int) -> Bool
    func savePost(post:Post) -> Bool
}

class DefaultPostDetailsService: PostDetailsService{
    func getPostDetails(postID:Int, completionHandler: @escaping (Post?, APIError?) -> ()) {
        let handler = GetPostDetailsHandler()
        let apiLoader = APILoader( apiHandler: handler)
        
        apiLoader.loadAPIRequest(urlParam: ["postID":"\(postID)"],
                                 queryParam: nil,
                                 bodyParam: nil)
        { content, error in
            completionHandler(content ,error)
        }
    }
    func checkPostSaved(id:Int) -> Bool{
        let request = SavedPost.fetchRequest()
        request.predicate = NSPredicate(format: "id = %d", id)
        do {
            let entities = try PersistenceController.shared.container.viewContext.fetch(request)
            return entities.count > 0
        } catch  {
            return false
        }
    }
    func savePost(post: Post) -> Bool {
        let entity = SavedPost(context: PersistenceController.shared.container.viewContext)
        entity.userId = Int64(post.userId)
        entity.id = Int64(post.id)
        entity.title = post.title
        entity.body = post.body
        return PersistenceController.shared.save()
    }
    
}
