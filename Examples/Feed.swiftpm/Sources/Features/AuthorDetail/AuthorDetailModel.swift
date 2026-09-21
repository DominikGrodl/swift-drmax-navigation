import Observation

@Observable
final class AuthorDetailModel: HashableObject {
    let title: String
    
    let articles: [ArticleCellModel]
    
    enum DelegateAction {
        case navigateToArticle(Article)
        case navigateToAuthor(name: String)
        case navigateToSource(name: String)
        case dismiss
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(authorName: String) {
        self.title = authorName
        self.articles = [Article].mock.filter { $0.authorName == authorName }.map { ArticleCellModel(article: $0) }
        
        articles.forEach {
            $0.delegate = { [weak self] in
                self?.handleArticleCellModelDelegate(action: $0)
            }
        }
    }
    
    func closeButtonTapped() {
        delegate(.dismiss)
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
        case .navigateToAuthor(let name):
            delegate(.navigateToAuthor(name: name))
        }
    }
}
