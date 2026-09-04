import SwiftUI

struct PostDetailView: View {
    let model: PostDetailModel
    
    var body: some View {
        VStack {
            Text(model.post.text)
            
            Button(model.post.groupName, systemImage: "chevron.right") {
                model.groupButtonTapped()
            }
        }
        .navigationTitle(model.post.authorName)
    }
}
