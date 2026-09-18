import Foundation
import Observation

@Observable
final class FeedModel {
    let articles: [ArticleCellModel]
    
    enum DelegateAction {
        case navigateToArticle(Article)
        case navigateToSource(name: String)
        case navigateToAuthor(name: String)
        case navigateToLogin
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init() {
        self.articles = Array<Article>.mock.map { ArticleCellModel(article: $0) }
        
        articles.forEach { model in
            model.delegate = { [weak self] action in
                self?.handleArticleCellModelDelegate(action: action)
            }
        }
    }
    
    func loginButtonTapped() {
        delegate(.navigateToLogin)
    }
}

// MARK: - Delegate
private extension FeedModel {
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
