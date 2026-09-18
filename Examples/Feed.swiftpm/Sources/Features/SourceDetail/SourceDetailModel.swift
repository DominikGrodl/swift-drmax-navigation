import Observation

@Observable
final class SourceDetailModel: HashableObject {
    let title: String
    
    let articles: [ArticleCellModel]
    
    enum DelegateAction {
        case navigateToArticle(Article)
        case navigateToSource(name: String)
        case navigateToAuthor(name: String)
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(sourceName: String) {
        self.title = sourceName
        self.articles = [Article].mock.filter { $0.source == sourceName }.map { ArticleCellModel(article: $0) }
        
        articles.forEach {
            $0.delegate = { [weak self] action in
                self?.handleArticleCellModelDelegate(action: action)
            }
        }
    }
    
    func authorTapped(name: String) {
        delegate(.navigateToAuthor(name: name))
    }
    
    func articleTapped(_ article: Article) {
        delegate(.navigateToArticle(article))
    }
    
    func sourceTapped(name: String) {
        delegate(.navigateToSource(name: name))
    }
}

// MARK: - Delegate
private extension SourceDetailModel {
    func handleArticleCellModelDelegate(action: ArticleCellModel.DelegateAction) {
        switch action {
        case .navigateToSource(let name):
            delegate(.navigateToSource(name: name))
            
        case .navigateToArticle(let article):
            delegate(.navigateToArticle(article))
            
        case .navigateToAuthor(let name):
            delegate(.navigateToAuthor(name: name))
        }
    }
}
