import DrMaxNavigation
import Observation
import CasePaths

@Observable
final class FeedCoordinator<ParentDestination: Hashable & CasePathable & FeedDestinationProviding>: HashableObject {
    let controller: NavigationController<ParentDestination, FeedDestination>
    let feedModel: FeedModel
    
    /*
     Coordinators should not generally depend on each other, because it's very easy to create
     cyclic dependencies and a coordinator should not ever care what a different coordinator does.
     
     Therefore we let the root coordinator handle navigating between siblings.
    */
    enum DelegateAction {
        case navigateToLogin
    }
    
    var delegate: (DelegateAction) -> Void = { reportUnimplemented($0) }
    
    init(
        controller: NavigationController<ParentDestination, FeedDestination>
    ) {
        self.controller = controller
        
        self.feedModel = FeedModel()
        
        feedModel.delegate = { [weak self] action in
            self?.handleFeedModelDelegate(action: action)
        }
    }
    
    private func navigateToSourceDetail(name: String) {
        let model = SourceDetailModel(sourceName: name)
        
        model.delegate = { [weak self] action in
            self?.handleSourceDetailModelDelegate(action: action)
        }
        
        controller.navigate(to: .sourceDetail(model))
    }
    
    private func navigateToArticleDetail(article: Article) {
        let model = ArticleDetailModel(article: article)
        
        model.delegate = { [weak self] action in
            self?.handleArticleDetailModelDelegate(action: action)
        }
        
        controller.navigate(to: .articleDetail(model))
    }
    
    private func navigateToAuthorDetail(name: String) {
        let model = AuthorDetailModel(authorName: name)
        
        model.delegate = { [weak self, weak model] action in
            self?.handleAuthorDetailModelDelegate(action: action, from: model)
        }
        
        controller.navigate(to: .authorDetail(model), style: .sheet)
    }
    
    func dismissAuthorDetail(model: AuthorDetailModel) {
        controller.parent.popBefore(.feed(.authorDetail(model)))
    }
}

// MARK: - Delegate
private extension FeedCoordinator {
    func handleFeedModelDelegate(action: FeedModel.DelegateAction) {
        switch action {
        case .navigateToArticle(let article):
            navigateToArticleDetail(article: article)
        case .navigateToSource(let name):
            navigateToSourceDetail(name: name)
        case .navigateToAuthor(let name):
            navigateToAuthorDetail(name: name)
        case .navigateToLogin:
            delegate(.navigateToLogin)
        }
    }
    
    func handleAuthorDetailModelDelegate(
        action: AuthorDetailModel.DelegateAction,
        from model: AuthorDetailModel?
    ) {
        switch action {
        case .navigateToArticle(let article):
            navigateToArticleDetail(article: article)
        case .navigateToAuthor(let name):
            navigateToAuthorDetail(name: name)
        case .navigateToSource(let name):
            navigateToSourceDetail(name: name)
        case .dismiss:
            guard let model else { return }
            dismissAuthorDetail(model: model)
        }
    }
    
    func handleArticleDetailModelDelegate(action: ArticleDetailModel.DelegateAction) {
        switch action {
        case .navigateToAuthorDetail(let name):
            navigateToAuthorDetail(name: name)
        case .navigateToSourceDetail(let name):
            navigateToSourceDetail(name: name)
        }
    }
    
    func handleSourceDetailModelDelegate(action: SourceDetailModel.DelegateAction) {
        switch action {
        case .navigateToArticle(let article):
            navigateToArticleDetail(article: article)
        case .navigateToSource(let name):
            navigateToSourceDetail(name: name)
        case .navigateToAuthor(let name):
            navigateToAuthorDetail(name: name)
        }
    }
}
