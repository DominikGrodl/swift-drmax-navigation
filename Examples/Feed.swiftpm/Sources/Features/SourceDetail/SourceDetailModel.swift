import Observation

@Observable
final class SourceDetailModel: HashableObject {
    let title: String
    
    let articles: [Article]
    
    var navigate: (NavigationAction) -> Void = { _ in }
    
    enum NavigationAction {
        case articleDetail(Article)
        case authorDetail(name: String)
        case sourceDetail(name: String)
    }
    
    init(sourceName: String) {
        self.title = sourceName
        self.articles = .mock.filter { $0.source == sourceName }
    }
    
    func authorTapped(name: String) {
        navigate(.authorDetail(name: name))
    }
    
    func articleTapped(_ article: Article) {
        navigate(.articleDetail(article))
    }
    
    func sourceTapped(name: String) {
        navigate(.sourceDetail(name: name))
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}
