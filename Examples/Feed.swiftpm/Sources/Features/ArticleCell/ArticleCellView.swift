import SwiftUI

struct ArticleCellView: View {
    let model: ArticleCellModel
    
    var body: some View {
        ArticleView(
            article: model.article,
            isBookmarked: model.isBookmarked,
            addBookmard: model.bookmark,
            removeBookmark: model.removeBookmark,
            sourceTapped: model.sourceTapped,
            articleTapped: model.articleTapped
        )
    }
}
