import SwiftUI

struct PostView<TopTrailingContent: View>: View {
    let post: Post
    let onPostTapped: (Post) -> Void
    let topTrailingContent: () -> TopTrailingContent
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(post.authorName)
                    .font(.headline)
                
                Spacer()
                
                topTrailingContent()
            }
            
            Text(post.text)
        }
        .onTapGesture {
            onPostTapped(post)
        }
    }
}

extension PostView where TopTrailingContent == EmptyView {
    init(
        post: Post,
        onPostTapped: @escaping (Post) -> Void
    ) {
        self.init(
            post: post,
            onPostTapped: onPostTapped,
            topTrailingContent: { EmptyView() }
        )
    }
}
