import SwiftUI

struct FeedDestinationView: View {
    let destination: FeedDestination
    
    var body: some View {
        switch destination {
        case let .articleDetail(articleDetailModel):
            ArticleDetailView(model: articleDetailModel)
        case let .authorDetail(authorDetailModel):
            AuthorDetailView(model: authorDetailModel)
        case let .sourceDetail(sourceDetailModel):
            SourceDetailView(model: sourceDetailModel)
        }
    }
}
