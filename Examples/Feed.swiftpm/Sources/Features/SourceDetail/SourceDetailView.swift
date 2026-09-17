import SwiftUI

struct SourceDetailView: View {
    let model: SourceDetailModel
    
    var body: some View {
        List(
            model.articles,
            id: \.title,
            rowContent: cell
        )
        .listStyle(.plain)
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func cell(article: Article) -> some View {
        ArticleView(
            article: article,
            onArticleTapped: model.articleTapped,
            onSourceTapped: model.sourceTapped
        ) {
            AuthorView(
                authorName: article.authorName,
                imageUrlString: article.authorHeadshotUrl,
                onTapped: { model.authorTapped(name: article.authorName) }
            )
        }
    }
}
