import Foundation

@Observable
final class BookmarksStore {
    private(set) var bookmarks: Set<Article> = []
    
    func bookmark(article: Article) {
        bookmarks.insert(article)
    }
    
    func remove(article: Article) {
        bookmarks.remove(article)
    }
}
