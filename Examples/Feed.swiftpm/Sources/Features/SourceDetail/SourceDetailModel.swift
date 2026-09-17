import Observation

@Observable
final class SourceDetailModel: HashableObject {
    let title: String
    
    let articles: [ArticleCellModel]
    
    enum DelegateAction {
        case navigateToArticle(Article)
        case navigateToSource(name: String)
        case navigateToAuthor(name: String)
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(
        sourceName: String,
        bookmarksStore: BookmarksStore
    ) {
        self.title = sourceName
        self.articles = Array<Article>.mock.filter { $0.source == sourceName }.map { ArticleCellModel(article: $0, bookmarksStore: bookmarksStore) }
    }
    
    func authorTapped(name: String) {
        delegate(.navigateToAuthor(name: name))
    }
    
    func articleTapped(_ article: Article) {
        delegate(.navigateToArticle(article))
    }
    
    func sourceTapped(name: String) {
        delegate(.navigateToSource(name: name))
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}
