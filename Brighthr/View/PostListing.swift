//
//  PostListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostListing: View {
    
    @StateObject var viewModel: PostListViewModel = PostListViewModel(service: DefaultPostListService())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    PostListingCell(postTitle: post.title, postBody: post.body, postId: post.id)
                }
            }
            .onAppear () {
                fetchPosts()
            }
        }
    }
    
    func fetchPosts(){
        viewModel.fetchPosts(complitionHandler: { error in
        })
    }
}
