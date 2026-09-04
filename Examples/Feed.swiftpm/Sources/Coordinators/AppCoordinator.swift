import DrMaxNavigation
import Observation
import CasePaths

@CasePathable
enum AppDestination: Hashable {
    case feedCoordinator(FeedCoordinator<Self>)
    case feed(FeedDestination)
}

@Observable
final class AppCoordinator {
    let controller: RootNavigationController<AppDestination>
    
    init() {
        let controller = RootNavigationController<AppDestination>()
        
        let feedCoordinator = FeedCoordinator(controller: controller.pullback(on: \.feed))
        
        controller.set(root: .feedCoordinator(feedCoordinator))
        
        self.controller = controller
    }
}
