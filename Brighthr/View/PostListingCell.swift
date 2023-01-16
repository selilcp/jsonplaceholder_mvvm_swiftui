//
//  PostListingCell.swift
//  Brighthr
//
//  Created by selil on 16/01/23.
//

import SwiftUI

struct PostListingCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading,spacing: 6) {
                Text("Title")
                    .bold()
                    .font(.title3)
                Text("Details")
                    .lineLimit(3)
                    .font(.body)
            }
        }
    }
}
