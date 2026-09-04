import SwiftUI

struct GroupDetailView: View {
    let model: GroupDetailModel
    
    var body: some View {
        List(
            model.posts,
            rowContent: cell
        )
        .listStyle(.plain)
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Close", systemImage: "xmark") {
                    model.closeButtonTapped()
                }
            }
        }
    }
    
    func cell(post: Post) -> some View {
        PostView(post: post) { post in
            model.postTapped(post)
        }
    }
}
