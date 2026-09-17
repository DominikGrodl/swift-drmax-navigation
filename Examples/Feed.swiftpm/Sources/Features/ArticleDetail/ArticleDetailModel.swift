import Foundation
import Observation

final class ArticleDetailModel: HashableObject {
    let article: Article
    
    var navigate: (NavigationAction) -> Void = { _ in }
    
    enum NavigationAction {
        case toAuthorDetail(name: String)
        case toSourceDetail(name: String)
    }
    
    init(
        article: Article
    ) {
        self.article = article
    }
    
    func authorButtonTapped() {
        navigate(.toAuthorDetail(name: article.authorName))
    }
    
    func sourceButtonTapped() {
        navigate(.toSourceDetail(name: article.source))
    }
    
    deinit {
        print("\(Self.self).deinit")
    }
}
