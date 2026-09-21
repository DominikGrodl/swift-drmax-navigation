import Foundation
import Observation

final class ArticleDetailModel: HashableObject {
    let article: Article
    
    enum DelegateAction {
        case navigateToAuthorDetail(name: String)
        case navigateToSourceDetail(name: String)
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(article: Article) {
        self.article = article
    }
    
    func authorButtonTapped() {
        delegate(.navigateToAuthorDetail(name: article.authorName))
    }
    
    func sourceButtonTapped() {
        delegate(.navigateToSourceDetail(name: article.source))
    }
}
