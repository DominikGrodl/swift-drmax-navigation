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
    
    init(
        controller: NavigationController<ParentDestination, FeedDestination>
    ) {
        self.controller = controller
        
        self.feedModel = FeedModel()
        
        feedModel.navigate = { [weak self] action in
            self?.handleFeedNavigation(action: action)
        }
    }
    
    private func handleSourceDetailNavigation(action: SourceDetailModel.NavigationAction) {
        switch action {
        case let .articleDetail(article): navigateToArticleDetail(article: article)
        case let .authorDetail(name): navigateToAuthorDetail(name: name)
        case let .sourceDetail(name): navigateToSourceDetail(name: name)
        }
    }
    
    private func handleFeedNavigation(action: FeedModel.NavigationAction) {
        switch action {
        case let .articleDetail(article): navigateToArticleDetail(article: article)
        case let .authorDetail(name): navigateToAuthorDetail(name: name)
        case let .sourceDetail(name): navigateToSourceDetail(name: name)
        }
    }
    
    private func handleAuthorDetailNavigation(
        action: AuthorDetailModel.NavigationAction,
        model: AuthorDetailModel
    ) {
        switch action {
        case let .toSourceDetail(name): navigateToSourceDetail(name: name)
        case let .toArticleDetail(article): navigateToArticleDetail(article: article)
        case .dismiss: dismissAuthorDetail(model: model)
        }
    }
    
    private func handleArticleNavigation(action: ArticleDetailModel.NavigationAction) {
        switch action {
        case let .toAuthorDetail(name): navigateToAuthorDetail(name: name)
        case let .toSourceDetail(name): navigateToSourceDetail(name: name)
        }
    }
    
    private func navigateToSourceDetail(name: String) {
        let model = SourceDetailModel(sourceName: name)
        
        model.navigate = { [weak self] action in
            self?.handleSourceDetailNavigation(action: action)
        }
        
        controller.navigate(to: .sourceDetail(model))
    }
    
    private func navigateToArticleDetail(article: Article) {
        let model = ArticleDetailModel(article: article)
        
        model.navigate = { [weak self] action in
            self?.handleArticleNavigation(action: action)
        }
        
        controller.navigate(to: .articleDetail(model))
    }
    
    private func navigateToAuthorDetail(name: String) {
        let model = AuthorDetailModel(authorName: name)
        
        model.navigate = { [weak self, weak model] action in
            guard let model else { return }
            self?.handleAuthorDetailNavigation(action: action, model: model)
        }
        
        controller.navigate(to: .authorDetail(model), style: .sheet)
    }
    
    func dismissAuthorDetail(model: AuthorDetailModel) {
        controller.parent.popBefore(.feed(.authorDetail(model)))
    }
}
