import SwiftUI

struct AuthorDetailView: View {
    let model: AuthorDetailModel
    
    var body: some View {
        List(
            model.articles,
            id: \.title,
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
    
    func cell(article: Article) -> some View {
        ArticleView(
            article: article,
            onSourceTapped: model.sourceTapped,
            onArticleTapped: model.articleTapped
        )
    }
}
