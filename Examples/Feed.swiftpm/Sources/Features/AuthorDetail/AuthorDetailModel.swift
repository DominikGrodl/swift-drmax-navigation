import Observation

@Observable
final class AuthorDetailModel: HashableObject {
    let title: String
    
    let articles: [ArticleCellModel]
    
    let bookmarksStore: BookmarksStore
    
    enum DelegateAction {
        case navigateToArticle(Article)
        case navigateToAuthor(name: String)
        case navigateToSource(name: String)
        case dismiss
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(
        authorName: String,
        bookmarksStore: BookmarksStore
    ) {
        self.bookmarksStore = bookmarksStore
        self.title = authorName
        self.articles = Array<Article>.mock.filter { $0.authorName == authorName }.map { ArticleCellModel(article: $0, bookmarksStore: bookmarksStore) }
        
        articles.forEach {
            $0.delegate = { [weak self] in
                self?.handleArticleCellModelDelegate(action: $0)
            }
        }
    }
    
    func isBookmarked(article: Article) -> Bool {
        bookmarksStore.bookmarks.contains(article)
    }
    
    func closeButtonTapped() {
        delegate(.dismiss)
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}

// MARK: - Delegate
private extension AuthorDetailModel {
    func handleArticleCellModelDelegate(action: ArticleCellModel.DelegateAction) {
        switch action {
        case .navigateToSource(let name):
            delegate(.navigateToSource(name: name))
        case .navigateToArticle(let article):
            delegate(.navigateToArticle(article))
        }
    }
}
