import SwiftUI

struct FeedView: View {
    let model: FeedModel
    
    var body: some View {
        List(
            model.posts,
            rowContent: cell
        )
        .listStyle(.plain)
    }
    
    private func cell(post: Post) -> some View {
        PostView(
            post: post,
            onPostTapped: { post in
                model.postTapped(post)
            }
        ) {
            Text(post.groupName)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    model.groupTapped(name: post.groupName)
                }
        }
    }
}
