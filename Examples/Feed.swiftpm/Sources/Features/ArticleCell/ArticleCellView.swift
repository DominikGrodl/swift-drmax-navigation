import SwiftUI

struct ArticleCellView: View {
    let model: ArticleCellModel
    
    var body: some View {
        ArticleView(
            article: model.article,
            sourceTapped: model.sourceTapped,
            articleTapped: model.articleTapped,
            authorTapped: model.authorTapped
        )
    }
}
