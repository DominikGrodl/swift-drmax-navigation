import Observation

@Observable
final class BookmarksModel: HashableObject {
    let store: BookmarksStore
    
    enum DelegateAction {
        case navigateToSource(name: String)
        case navigateToArticle(Article)
        case navigateToLogin
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(store: BookmarksStore) {
        self.store = store
    }
    
    func loginButtonTapped() {
        delegate(.navigateToLogin)
    }
    
    func bookmark(article: Article) {
        store.bookmark(article: article)
    }
    
    func removeBookmark(article: Article) {
        store.remove(article: article)
    }
    
    func sourceTapped(name: String) {
        delegate(.navigateToSource(name: name))
    }
    
    func articleTapped(_ article: Article) {
        delegate(.navigateToArticle(article))
    }
}
