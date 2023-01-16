//
//  CommentListing.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct CommentListing: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 6) {
            Text("Title")
                .bold()
                .font(.title3)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 40))
            Text("comments.....")
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 40))
                .font(.body)
        }
    }
}
