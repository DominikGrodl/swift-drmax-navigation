/*
 Both destination enums hold onto LoginCoordinator and its destinations. Navigating to the loginCoordinator
 case means it can manage its own navigation and push/present its destinations. This way you can share
 shared navigation logic between multiple unrelared parts of your app. Both Feed and Settings can navigate to Login, so they
 both navigate to LoginCoordinator and let it handle its navigation.
*/

import CasePaths

@CasePathable
enum FeedCoordinatorDestination: Hashable, FeedDestinationProviding, LoginCoordinatorDestinationProviding {
    case feedCoordinator(FeedCoordinator<Self>)
    case feed(FeedDestination)
    case loginCoordinator(LoginCoordinator<Self>)
    case login(LoginDestination)
}

protocol LoginCoordinatorDestinationProviding: Hashable & CasePathable {
    static func loginCoordinator(_ : LoginCoordinator<Self>) -> Self
}

@CasePathable
enum SettingsDestination: Hashable, LoginCoordinatorDestinationProviding {
    case settingsCoordinator(SettingsCoordinator<Self>)
    case settingsDestination(SettingsCoordinatorDestination)
    case loginCoordinator(LoginCoordinator<Self>)
    case loginDestination(LoginDestination)
}
