import Observation

final class ArticleCellModel: Identifiable {
    let article: Article
   
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    enum DelegateAction {
        case navigateToSource(name: String)
        case navigateToArticle(Article)
        case navigateToAuthor(name: String)
    }
    
    init(article: Article) {
        self.article = article
    }
    
    func sourceTapped() {
        delegate(.navigateToSource(name: article.source))
    }
    
    func articleTapped() {
        delegate(.navigateToArticle(article))
    }
    
    func authorTapped() {
        delegate(.navigateToAuthor(name: article.authorName))
    }
}
