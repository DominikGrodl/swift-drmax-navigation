import Observation

final class ArticleCellModel: Identifiable {
    let article: Article
    let bookmarksStore: BookmarksStore
    
    weak var delegate: ArticleCellModelDelegate?
    
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
        delegate?.articleCellModel(self, shouldNavigateToSource: article.source)
    }
    
    func articleTapped() {
        delegate?.articleCellModel(self, shouldNavigateToArticle: article)
    }
    
    func bookmark() {
        bookmarksStore.bookmark(article: article)
    }
    
    func removeBookmark() {
        bookmarksStore.remove(article: article)
    }
}

protocol ArticleCellModelDelegate: AnyObject {
    func articleCellModel(_ model: ArticleCellModel, shouldNavigateToSource name: String)
    func articleCellModel(_ model: ArticleCellModel, shouldNavigateToArticle article: Article)
}
