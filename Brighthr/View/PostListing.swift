//
//  PostListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostListing: View {
    
    @StateObject var viewModel: PostViewModel = PostViewModel(service: DefaultPostViewService())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    PostListingCell(postTitle: post.title, postBody: post.body)
                }
            }
                .onAppear () {
                    fetchPosts()
                }
        }
    }
    
    func fetchPosts(){
        viewModel.fetchPosts(complitionHandler: { error in
            print("dsd")
        })
    }
}
