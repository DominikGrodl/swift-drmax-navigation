import Foundation
import Observation

final class ArticleDetailModel: HashableObject {
    let article: Article
    private let bookmarksStore: BookmarksStore
    
    enum DelegateAction {
        case navigateToAuthorDetail(name: String)
        case navigateToSourceDetail(name: String)
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(
        article: Article,
        bookmarksStore: BookmarksStore
    ) {
        self.article = article
        self.bookmarksStore = bookmarksStore
    }
    
    var bookmarkButtonTitle: String {
        isBookmarked ? "Remove bookmark" : "Bookmark"
    }
    
    var bookmarkImageSystemName: String {
        isBookmarked ? "bookmark.fill" : "bookmark"
    }
    
    var isBookmarked: Bool {
        bookmarksStore.bookmarks.contains(article)
    }
    
    func bookmarkButtonTapped() {
        if isBookmarked {
            bookmarksStore.remove(article: article)
        } else {
            bookmarksStore.bookmark(article: article)
        }
    }
    
    func authorButtonTapped() {
        delegate(.navigateToAuthorDetail(name: article.authorName))
    }
    
    func sourceButtonTapped() {
        delegate(.navigateToSourceDetail(name: article.source))
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}
