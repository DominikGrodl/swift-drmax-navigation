import SwiftUI
import DrMaxNavigation

struct AppView: View {
    let coordinator: AppCoordinator
    
    var body: some View {
        RootNavigationControllerView(controller: coordinator.controller) { screen in
            switch screen {
            case let .feedCoordinator(coordinator): FeedCoordinatorView(coordinator: coordinator)
            case let .feed(destination): FeedDestinationView(destination: destination)
            }
        }
    }
}
