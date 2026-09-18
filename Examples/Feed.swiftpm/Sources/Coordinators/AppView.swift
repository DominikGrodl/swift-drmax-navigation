import DrMaxNavigation
import SwiftUI

struct AppView: View {
    let coordinator: AppCoordinator
    
    var body: some View {
        TabView {
            feed
            
            settings
        }
    }
    
    var feed: some View {
        /*
        Same as RootNavigationController: You create RootNavigationControllerView once and subsequent presentation handles
        putting your Views inside a NavigationStack for you when needed.
        */
        RootNavigationControllerView(controller: coordinator.feedController) { screen in
            switch screen {
            case let .feedCoordinator(coordinator): FeedCoordinatorView(coordinator: coordinator)
            case let .feed(destination): FeedDestinationView(destination: destination)
            case let .loginCoordinator(coordinator): LoginCoordinatorView(coordinator: coordinator)
            case let .login(destination): LoginDestinationView(destination: destination)
            }
        }
        .tabItem {
            Label("Latest", systemImage: "newspaper")
        }
    }
    
    var settings: some View {
        RootNavigationControllerView(controller: coordinator.settingsController) { screen in
            switch screen {
            case let .settingsCoordinator(coordinator): SettingsCoordinatorView(coordinator: coordinator)
            case let .settingsDestination(destination): SettingsDestinationView(destination: destination)
            case let .loginCoordinator(coordinator): LoginCoordinatorView(coordinator: coordinator)
            case let .loginDestination(destination): LoginDestinationView(destination: destination)
            }
        }
        .tabItem {
            Label("Settings", systemImage: "gear")
        }
    }
}
