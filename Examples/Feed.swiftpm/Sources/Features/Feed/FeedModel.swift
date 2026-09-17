import Foundation
import Observation

@Observable
final class FeedModel {
    let articles: [ArticleCellModel]
    
    weak var delegate: FeedModelDelegate? {
        didSet {
            articles.forEach {
                $0.delegate = delegate
            }
        }
    }
    
    init(
        bookmarksStore: BookmarksStore
    ) {
        self.articles = Array<Article>.mock.map { ArticleCellModel(article: $0, bookmarksStore: bookmarksStore) }
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}

protocol FeedModelDelegate: ArticleCellModelDelegate {
    func feedModel(_ model: FeedModel, shouldNavigateToArticleDetail article: Article)
    func feedModel(_ model: FeedModel, shouldNavigateToAuthorDetail name: String)
    func feedModel(_ model: FeedModel, shouldNavigateToSourceDetail name: String)
}
