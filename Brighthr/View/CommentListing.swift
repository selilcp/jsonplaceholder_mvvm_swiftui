//
//  CommentListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct CommentListing: View {
    
    var postId:Int
    @StateObject var viewModel: PostCommentsViewModel = PostCommentsViewModel( service: DefaultCommentListService() )
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6) {
            ForEach(viewModel.comments) { comment in
                Text(comment.name)
                    .bold()
                    .font(.title3)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 40))
                Text(comment.body)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 40))
                    .font(.body)
            }
        }
        .onAppear(){
            viewModel.fetchPostDetails(postID: postId) { error in
                
            }
        }
    }
}
