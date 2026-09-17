import DrMaxNavigation
import Observation
import CasePaths

@Observable
final class AppCoordinator {
    let feedController: RootNavigationController<FeedCoordinatorDestination>
    let settingsController: RootNavigationController<SettingsDestination>
    
    init(
        bookmarksStore: BookmarksStore
    ) {
        let feedController = RootNavigationController<FeedCoordinatorDestination>()
        
        let feedCoordinator = FeedCoordinator(
            controller: feedController.pullback(on: \.feed),
            bookmarksStore: bookmarksStore
        )
        
        feedController.set(root: .feedCoordinator(feedCoordinator))
        
        self.feedController = feedController
        
        let settingsController = RootNavigationController<SettingsDestination>()
        
        let settingsCoordinator = SettingsCoordinator(controller: settingsController.pullback(on: \.settingsDestination))
        
        settingsController.set(root: .settingsCoordinator(settingsCoordinator))
        
        self.settingsController = settingsController
        
        feedCoordinator.delegate = { [weak self] action in
            self?.handleFeedCoordinatorDelegate(action: action)
        }
        
        settingsCoordinator.delegate = { [weak self] action in
            self?.handleSettingsCoordinatorDelegate(action: action)
        }
    }
}

// MARK: - Delegate
private extension AppCoordinator {
    func handleFeedCoordinatorDelegate(action: FeedCoordinator<FeedCoordinatorDestination>.DelegateAction) {
        switch action {
        case .navigateToLogin:
            navigateToLogin(
                on: feedController,
                loginDestination: \.login,
                style: .sheet
            )
        }
    }
    
    func handleSettingsCoordinatorDelegate(action: SettingsCoordinator<SettingsDestination>.DelegateAction) {
        switch action {
        case .navigateToLogin:
            navigateToLogin(
                on: settingsController,
                loginDestination: \.loginDestination,
                style: .push
            )
        }
    }
}

// MARK: - Navigation
private extension AppCoordinator {
    func navigateToLogin<Parent: LoginCoordinatorDestinationProviding>(
        on controller: RootNavigationController<Parent>,
        loginDestination: CaseKeyPath<Parent, LoginDestination>,
        style: NavigationStyle
    ) {
        let coordinator = LoginCoordinator(controller: controller.pullback(on: loginDestination))
        
        coordinator.onDismiss = { [weak coordinator, weak controller] in
            guard let coordinator, let controller else { return }
            controller.popBefore(.loginCoordinator(coordinator))
        }
        
        controller.navigate(
            to: .loginCoordinator(coordinator),
            style: style
        )
    }
}
