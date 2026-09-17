import Observation

@Observable
final class AuthorDetailModel: HashableObject {
    let title: String
    
    let articles: [ArticleCellModel]
    
    let bookmarksStore: BookmarksStore
    
    weak var delegate: AuthorDetailModelDelegate? {
        didSet {
            articles.forEach { $0.delegate = delegate }
        }
    }
    
    init(
        authorName: String,
        bookmarksStore: BookmarksStore
    ) {
        self.bookmarksStore = bookmarksStore
        self.title = authorName
        self.articles = Array<Article>.mock.filter { $0.authorName == authorName }.map { ArticleCellModel(article: $0, bookmarksStore: bookmarksStore) }
    }
    
    func isBookmarked(article: Article) -> Bool {
        bookmarksStore.bookmarks.contains(article)
    }
    
    func closeButtonTapped() {
        delegate?.authorDetailModelShouldDismiss(self)
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}

protocol AuthorDetailModelDelegate: ArticleCellModelDelegate {
    func authorDetailModel(_ model: AuthorDetailModel, shouldNavigateToArticleDetail article: Article)
    func authorDetailModel(_ model: AuthorDetailModel, shouldNavigateToSourceDetail name: String)
    func authorDetailModelShouldDismiss(_ model: AuthorDetailModel)
}
