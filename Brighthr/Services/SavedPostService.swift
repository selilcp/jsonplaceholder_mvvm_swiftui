//
//  SavedPostService.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

protocol SavedPostService {
    func getSavedPosts(completionHandler: @escaping ([Post]?, Error?) -> ())
}

class DefaultSavedPostService: SavedPostService{
    func getSavedPosts(completionHandler: @escaping ([Post]?, Error?) -> ()) {
        let request = SavedPost.fetchRequest()
        do {
            let entities = try PersistenceController.shared.container.viewContext.fetch(request)
            var posts: [Post] = []
            for element in entities {
                posts.append(Post(userId: Int(element.userId),
                                  id: Int(element.id),
                                  title: element.title ?? "",
                                  body: element.body ?? ""))
            }
            completionHandler(posts, nil)
        } catch let error {
            completionHandler(nil,error)
        }
    }
}
