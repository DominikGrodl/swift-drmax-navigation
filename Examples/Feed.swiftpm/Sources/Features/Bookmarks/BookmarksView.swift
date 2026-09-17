import SwiftUI

struct BookmarksView: View {
    let model: BookmarksModel
    
    var body: some View {
        List(
            Array(model.store.bookmarks),
            id: \.title,
            rowContent: cell
        )
        .navigationTitle("Bookmarks")
        .toolbarTitleDisplayMode(.inlineLarge)
    }
    
    func cell(article: Article) -> some View {
        ArticleView(
            article: article,
            isBookmarked: true,
            addBookmard: { model.bookmark(article: article) },
            removeBookmark: { model.removeBookmark(article: article) },
            sourceTapped: { model.sourceTapped(name: article.source) },
            articleTapped: { model.articleTapped(article) }
        )
    }
}
