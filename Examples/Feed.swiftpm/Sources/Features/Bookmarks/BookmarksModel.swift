import Observation

@Observable
final class BookmarksModel: HashableObject {
    let store: BookmarksStore
    
    weak var delegate: BookmarksModelDelegate?
    
    init(store: BookmarksStore) {
        self.store = store
    }
    
    func bookmark(article: Article) {
        store.bookmark(article: article)
    }
    
    func removeBookmark(article: Article) {
        store.remove(article: article)
    }
    
    func sourceTapped(name: String) {
        delegate?.bookmarksModel(self, shouldNavigateToSourceDetail: name)
    }
    
    func articleTapped(_ article: Article) {
        delegate?.bookmarksModel(self, shouldNavigateToArticleDetail: article)
    }
}

protocol BookmarksModelDelegate: AnyObject {
    func bookmarksModel(_ model: BookmarksModel, shouldNavigateToSourceDetail name: String)
    func bookmarksModel(_ model: BookmarksModel, shouldNavigateToArticleDetail article: Article)
}
