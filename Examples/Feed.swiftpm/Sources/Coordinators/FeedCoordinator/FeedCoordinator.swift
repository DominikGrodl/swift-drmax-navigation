import DrMaxNavigation
import Observation
import CasePaths

@CasePathable
enum FeedDestination: Hashable {
    case articleDetail(ArticleDetailModel)
    case authorDetail(AuthorDetailModel)
    case sourceDetail(SourceDetailModel)
}

protocol FeedDestinationProviding {
    static func feed(_ destination: FeedDestination) -> Self
}

@Observable
final class FeedCoordinator<ParentDestination: Hashable & CasePathable & FeedDestinationProviding>: HashableObject {
    let controller: NavigationController<ParentDestination, FeedDestination>
    let feedModel: FeedModel
    
    private let bookmarksStore: BookmarksStore
    
    init(
        controller: NavigationController<ParentDestination, FeedDestination>,
        bookmarksStore: BookmarksStore
    ) {
        self.controller = controller
        
        self.feedModel = FeedModel(bookmarksStore: bookmarksStore)
        
        self.bookmarksStore = bookmarksStore
        
        feedModel.delegate = self
    }
    
    private func navigateToSourceDetail(name: String) {
        let model = SourceDetailModel(sourceName: name, bookmarksStore: bookmarksStore)
        model.delegate = self
        controller.navigate(to: .sourceDetail(model))
    }
    
    private func navigateToArticleDetail(article: Article) {
        let model = ArticleDetailModel(
            article: article,
            bookmarksStore: bookmarksStore
        )
        
        model.delegate = self
        
        controller.navigate(to: .articleDetail(model))
    }
    
    private func navigateToAuthorDetail(name: String) {
        let model = AuthorDetailModel(authorName: name, bookmarksStore: bookmarksStore)
        model.delegate = self
        controller.navigate(to: .authorDetail(model), style: .sheet)
    }
    
    func dismissAuthorDetail(model: AuthorDetailModel) {
        controller.parent.popBefore(.feed(.authorDetail(model)))
    }
}

extension FeedCoordinator: ArticleDetailModelDelegate {
    func articleDetailModel(_ model: ArticleDetailModel, shouldNavigateToAuthorDetail name: String) {
        navigateToAuthorDetail(name: name)
    }
    
    func articleDetailModel(_ model: ArticleDetailModel, shouldNavigateToSourceDetail name: String) {
        navigateToSourceDetail(name: name)
    }
}

extension FeedCoordinator: AuthorDetailModelDelegate {
    func articleCellModel(_ model: ArticleCellModel, shouldNavigateToSource name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func articleCellModel(_ model: ArticleCellModel, shouldNavigateToArticle article: Article) {
        navigateToArticleDetail(article: article)
    }
    
    func authorDetailModelShouldDismiss(_ model: AuthorDetailModel) {
        dismissAuthorDetail(model: model)
    }
    
    func authorDetailModel(_ model: AuthorDetailModel, shouldNavigateToSourceDetail name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func authorDetailModel(_ model: AuthorDetailModel, shouldNavigateToArticleDetail article: Article) {
        navigateToArticleDetail(article: article)
    }
}

extension FeedCoordinator: FeedModelDelegate {
    func feedModel(_ model: FeedModel, shouldNavigateToAuthorDetail name: String) {
        navigateToAuthorDetail(name: name)
    }
    
    func feedModel(_ model: FeedModel, shouldNavigateToSourceDetail name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func feedModel(_ model: FeedModel, shouldNavigateToArticleDetail article: Article) {
        navigateToArticleDetail(article: article)
    }
}

extension FeedCoordinator: SourceDetailModelDelegate {
    func sourceDetailModel(_ model: SourceDetailModel, shouldNavigateToAuthorDetail name: String) {
        navigateToAuthorDetail(name: name)
    }
    
    func sourceDetailModel(_ model: SourceDetailModel, shouldNavigateToSourceDetail name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func sourceDetailModel(_ model: SourceDetailModel, shouldNavigateToArticleDetail article: Article) {
        navigateToArticleDetail(article: article)
    }
}
