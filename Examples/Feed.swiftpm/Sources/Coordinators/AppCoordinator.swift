import DrMaxNavigation
import Observation
import CasePaths

@CasePathable
enum AppDestination: Hashable, FeedDestinationProviding {
    case feedCoordinator(FeedCoordinator<Self>)
    case feed(FeedDestination)
}

@CasePathable
enum BookmarksAppDestination: Hashable, BookmarksDestinationProviding {
    case bookmarksCoordinator(BookmarksCoordinator<Self>)
    case bookmarksDestination(BookmarksDestination)
}

@Observable
final class AppCoordinator {
    let controller: RootNavigationController<AppDestination>
    let bookmarksController: RootNavigationController<BookmarksAppDestination>
    
    init(
        bookmarksStore: BookmarksStore
    ) {
        let controller = RootNavigationController<AppDestination>()
        
        let feedCoordinator = FeedCoordinator(
            controller: controller.pullback(on: \.feed),
            bookmarksStore: bookmarksStore
        )
        
        controller.set(root: .feedCoordinator(feedCoordinator))
        
        self.controller = controller
        
        let bookmarksController = RootNavigationController<BookmarksAppDestination>()
        
        let bookmarksCoordinator = BookmarksCoordinator(
            controller: bookmarksController.pullback(on: \.bookmarksDestination),
            bookmarksStore: bookmarksStore
        )
        
        bookmarksController.set(root: .bookmarksCoordinator(bookmarksCoordinator))
        
        self.bookmarksController = bookmarksController
    }
}
