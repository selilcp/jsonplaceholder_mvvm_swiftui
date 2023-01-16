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
        List{
            ForEach(viewModel.comments) { comment in
                PostCommentCell(commentTitle: comment.name, commentBody: comment.body)
            }
        }
        .onAppear(){
            viewModel.fetchPostDetails(postID: postId) { error in
                
            }
        }
    }
}
