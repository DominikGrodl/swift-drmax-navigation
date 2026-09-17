import SwiftUI
import DrMaxNavigation

struct AppView: View {
    let coordinator: AppCoordinator
    
    var body: some View {
        TabView {
            RootNavigationControllerView(controller: coordinator.controller) { screen in
                switch screen {
                case let .feedCoordinator(coordinator): FeedCoordinatorView(coordinator: coordinator)
                case let .feed(destination): FeedDestinationView(destination: destination)
                }
            }
            .tabItem {
                Label("Latest", systemImage: "newspaper")
            }
            
            RootNavigationControllerView(controller: coordinator.bookmarksController) { screen in
                switch screen {
                case let .bookmarksCoordinator(coordinator): BookmarksCoordinatorView(coordinator: coordinator)
                case let .bookmarksDestination(destination): BookmarksDestinationView(destination: destination)
                }
            }
            .tabItem {
                Label("Bookmarks", systemImage: "bookmark")
            }
        }
    }
}
