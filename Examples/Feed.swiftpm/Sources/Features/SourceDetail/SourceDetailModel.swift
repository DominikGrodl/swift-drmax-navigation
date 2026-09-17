import Observation

@Observable
final class SourceDetailModel: HashableObject {
    let title: String
    
    let articles: [ArticleCellModel]
    
    weak var delegate: SourceDetailModelDelegate?
    
    init(
        sourceName: String,
        bookmarksStore: BookmarksStore
    ) {
        self.title = sourceName
        self.articles = Array<Article>.mock.filter { $0.source == sourceName }.map { ArticleCellModel(article: $0, bookmarksStore: bookmarksStore) }
    }
    
    func authorTapped(name: String) {
        delegate?.sourceDetailModel(self, shouldNavigateToAuthorDetail: name)
    }
    
    func articleTapped(_ article: Article) {
        delegate?.sourceDetailModel(self, shouldNavigateToArticleDetail: article)
    }
    
    func sourceTapped(name: String) {
        delegate?.sourceDetailModel(self, shouldNavigateToSourceDetail: name)
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}

protocol SourceDetailModelDelegate: AnyObject {
    func sourceDetailModel(_ model: SourceDetailModel, shouldNavigateToArticleDetail article: Article)
    func sourceDetailModel(_ model: SourceDetailModel, shouldNavigateToAuthorDetail name: String)
    func sourceDetailModel(_ model: SourceDetailModel, shouldNavigateToSourceDetail name: String)
}
