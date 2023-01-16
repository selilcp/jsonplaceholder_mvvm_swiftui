//
//  PostListingCell.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostListingCell: View {
    
    var postTitle: String
    var postBody: String
    var postId: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 6) {
                Text(postTitle)
                    .bold()
                    .font(.title3)
                Text(postBody)
                    .lineLimit(3)
                    .font(.body)
            }
            NavigationLink( destination: PostDetails(postId: postId)){
            
            }
                .buttonStyle(.plain)
        }
    }
}
