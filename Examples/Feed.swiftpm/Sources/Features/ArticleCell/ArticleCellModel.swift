import Observation

final class ArticleCellModel: Identifiable {
    let article: Article
    let bookmarksStore: BookmarksStore
   
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    enum DelegateAction {
        case navigateToSource(name: String)
        case navigateToArticle(Article)
    }
    
    init(
        article: Article,
        bookmarksStore: BookmarksStore
    ) {
        self.article = article
        self.bookmarksStore = bookmarksStore
    }
    
    var isBookmarked: Bool {
        bookmarksStore.bookmarks.contains(article)
    }
    
    func sourceTapped() {
        delegate(.navigateToSource(name: article.source))
    }
    
    func articleTapped() {
        delegate(.navigateToArticle(article))
    }
    
    func bookmark() {
        bookmarksStore.bookmark(article: article)
    }
    
    func removeBookmark() {
        bookmarksStore.remove(article: article)
    }
}
