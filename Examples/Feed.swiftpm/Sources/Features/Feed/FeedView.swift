import SwiftUI

struct FeedView: View {
    let model: FeedModel
    
    var body: some View {
        List(model.articles) {
            ArticleCellView(model: $0)
        }
        .listStyle(.plain)
        .navigationTitle("Latest")
        .toolbarTitleDisplayMode(.inlineLarge)
    }
}
