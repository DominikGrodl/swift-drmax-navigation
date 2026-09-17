import Observation

@Observable
final class AuthorDetailModel: HashableObject {
    let title: String
    
    let articles: [Article]
    
    var navigate: (NavigationAction) -> Void = { _ in }
    
    enum NavigationAction {
        case toArticleDetail(Article)
        case toSourceDetail(name: String)
        case dismiss
    }
    
    init(authorName: String) {
        self.title = authorName
        self.articles = .mock.filter { $0.authorName == authorName }
        self.navigate = navigate
    }
    
    func closeButtonTapped() {
        navigate(.dismiss)
    }
    
    func articleTapped(_ article: Article) {
        navigate(.toArticleDetail(article))
    }
    
    func sourceTapped(name: String) {
        navigate(.toSourceDetail(name: name))
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}
