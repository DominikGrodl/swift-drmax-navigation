import CasePaths
import Observation
import DrMaxNavigation

@Observable
final class BookmarksCoordinator<ParentDestination: Hashable & CasePathable & BookmarksDestinationProviding>: HashableObject {
    let controller: NavigationController<ParentDestination, BookmarksDestination>
    let bookmarksModel: BookmarksModel
    
    private let bookmarksStore: BookmarksStore
    
    init(
        controller: NavigationController<ParentDestination, BookmarksDestination>,
        bookmarksStore: BookmarksStore
    ) {
        self.controller = controller
        self.bookmarksModel = BookmarksModel(store: bookmarksStore)
        self.bookmarksStore = bookmarksStore
        
        bookmarksModel.delegate = self
    }
    
    private func navigateToArticleDetail(article: Article) {
        let model = ArticleDetailModel(
            article: article,
            bookmarksStore: bookmarksStore
        )
        
        model.delegate = self
        
        controller.navigate(to: .articleDetail(model))
    }
    
    private func navigateToSourceDetail(name: String) {
        let model = SourceDetailModel(sourceName: name, bookmarksStore: bookmarksStore)
        model.delegate = self
        controller.navigate(to: .sourceDetail(model))
    }
    
    private func navigateToAuthorDetail(name: String) {
        let model = AuthorDetailModel(authorName: name, bookmarksStore: bookmarksStore)
        model.delegate = self
        controller.navigate(to: .authorDetail(model))
    }
    
    private func dismiss(model: AuthorDetailModel) {
        controller.parent.popBefore(
            .bookmarksDestination(.authorDetail(model))
        )
    }
}

extension BookmarksCoordinator: ArticleDetailModelDelegate {
    func articleDetailModel(_ model: ArticleDetailModel, shouldNavigateToAuthorDetail name: String) {
        navigateToAuthorDetail(name: name)
    }
    
    func articleDetailModel(_ model: ArticleDetailModel, shouldNavigateToSourceDetail name: String) {
       navigateToSourceDetail(name: name)
    }
}

extension BookmarksCoordinator: AuthorDetailModelDelegate {
    func articleCellModel(_ model: ArticleCellModel, shouldNavigateToSource name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func articleCellModel(_ model: ArticleCellModel, shouldNavigateToArticle article: Article) {
        navigateToArticleDetail(article: article)
    }
    
    func authorDetailModelShouldDismiss(_ model: AuthorDetailModel) {
        dismiss(model: model)
    }
    
    func authorDetailModel(_ model: AuthorDetailModel, shouldNavigateToSourceDetail name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func authorDetailModel(_ model: AuthorDetailModel, shouldNavigateToArticleDetail article: Article) {
        navigateToArticleDetail(article: article)
    }
}

extension BookmarksCoordinator: SourceDetailModelDelegate {
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

extension BookmarksCoordinator: BookmarksModelDelegate {
    func bookmarksModel(_ model: BookmarksModel, shouldNavigateToSourceDetail name: String) {
        navigateToSourceDetail(name: name)
    }
    
    func bookmarksModel(_ model: BookmarksModel, shouldNavigateToArticleDetail article: Article) {
        navigateToArticleDetail(article: article)
    }
}

import SwiftUI

struct BookmarksCoordinatorView<ParentDestination: Hashable & CasePathable & BookmarksDestinationProviding>: View {
    let coordinator: BookmarksCoordinator<ParentDestination>
    
    var body: some View {
        BookmarksView(model: coordinator.bookmarksModel)
    }
}

struct BookmarksDestinationView: View {
    let destination: BookmarksDestination
    
    var body: some View {
        switch destination {
        case .articleDetail(let articleDetailModel):
            ArticleDetailView(model: articleDetailModel)
        case .sourceDetail(let sourceDetailModel):
            SourceDetailView(model: sourceDetailModel)
        case .authorDetail(let authorDetailModel):
            AuthorDetailView(model: authorDetailModel)
        }
    }
}
